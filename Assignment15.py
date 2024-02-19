import DBUtil

def main():
    DBUtil.assn = "Assignment15"
    DBUtil.db = "udb"

    comments, queries = DBUtil.read_queries(DBUtil.assn + ".sql")
    DBUtil.process_queries(comments, queries, DBUtil.db, DBUtil.assn)

    comments, queries = DBUtil.read_queries("Analytics.sql")
    DBUtil.process_queries(comments, queries, DBUtil.db, DBUtil.assn + "a")

if __name__ == '__main__':
    main()