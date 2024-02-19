# Queens College
# Database Systems (CSCI 331)
# Winter 2024
# Assignment 7 - Stored Procedures and Functions
# Quazi Uzma Nadeem

import Assignment3 as as3
import Assignment5 as as5


def main():
    comments, queries = as5.read_queries("Assignment7.sql")
    as5.process_queries(comments, queries, "udb", "Assignment 7")

    comments, queries = as5.read_queries("Analytics.sql")
    as5.process_queries(comments, queries, "udb", "Analytics")

if __name__ == "__main__":
    assignment = "Assignment 7"
    main()