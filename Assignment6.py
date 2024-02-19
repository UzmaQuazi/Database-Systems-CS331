# Queens College
# Database Systems (CSCI 331)
# Winter 2024
# Assignment 6 - DDL and DML practice
# Quazi Uzma Nadeem

import Assignment5 as as5
def main():
    db= "udb"
    assn = "Assignment6"
    comments, queries = as5.read_queries("Assignment6.sql")
    as5.process_queries(comments, queries,db, assn)

    comments, queries = as5.read_queries("Analytics.sql")
    as5.process_queries(comments, queries, db, assn + 'a')

if __name__ == "__main__":
    main()
