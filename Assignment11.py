# Queens College
# Database Systems (CSCI 331)
# Winter 2024
# Assignment 11 - Database Record Storage
# Quazi Uzma Nadeem


import Assignment5 as as5




def main():
    assn = "Assignment 11"
    db = "udb"
    comments, queries = as5.read_queries("Assignment11.sql")
    as5.process_queries(comments, queries, db, assn + "Fixed", debug=False, format="F")
    as5.process_queries(comments, queries, db, assn + "Variable", debug=False, format="V")

    comments, queries = as5.read_queries("Analytics.sql")
    as5.process_queries(comments, queries, db , f"{assn}-analytics")


if __name__ == '__main__':
    main()