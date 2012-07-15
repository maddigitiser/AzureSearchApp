using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

using Dapper;

namespace SearchService
{
    public class SearchResult
    {
        public String FileName { get; set; }
        public Single Relevance { get; set; }
    }

    public class IndexEntry
    {
        public String Token { get; set; }
        public String SourceFile { get; set; }
        public Int32 Occurances { get; set; }
    }

    public class QueryAndIndexService
    {
        private readonly String _connectionString;

        public QueryAndIndexService(String connectionString)
        {
            _connectionString = connectionString;
        }

        public Int32 Index(String fileName, String file)
        {
            Int32 inserted = 0;

            if (String.IsNullOrWhiteSpace(file) || String.IsNullOrWhiteSpace(fileName))
                return inserted;

            var indexedItems = new List<IndexEntry>();

            var tokens = file.Split(' ');
            var tokenGroups = tokens.GroupBy(t => t);

            //form a db entry for each file token
            foreach (var tokenGroup in tokenGroups)
            {
                indexedItems.Add(new IndexEntry
                {
                    Token = tokenGroup.Key,
                    Occurances = tokenGroup.Count(),
                    SourceFile = fileName
                });
            }

            //flush everything to the db
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                inserted = conn.Execute("insert TextIndex(Token, SourceFile, Occurances) values(@Token, @SourceFile, @Occurances)", indexedItems);
            }
            return inserted;
        }

        public IEnumerable<SearchResult> Query(String query)
        {
            var results = new List<SearchResult>();

            if (String.IsNullOrWhiteSpace(query))
                return results;

            var tokens = query.Split(' ');

            var builder = new SqlBuilder();
            var selector = builder.AddTemplate("select * from TextIndex /**where**/");
            foreach (var token in tokens)
            {
                builder.WhereAny("Token = @tkn", new { tkn = token });
            }
            using (var conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                var sqlResults = conn.Query(selector.RawSql, selector.Parameters);
                var grouped = sqlResults.GroupBy(r => (String)r.SourceFile, r => (Int32)r.Occurances);

                foreach (var group in grouped)
                {
                    results.Add(new SearchResult
                    {
                         FileName = group.Key,
                         Relevance = group.Sum(g => g)
                    });
                }
            }
            return results;
        }
    }
}
