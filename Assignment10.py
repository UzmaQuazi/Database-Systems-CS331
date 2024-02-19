# Queens College
# Database Systems (CSCI 331)
# Winter 2024
# Assignment 10 - Database Design and Normalization
# Quazi Uzma Nadeem

import sys
sys.path.append("..")
sys.path.append("../..")

import OutputUtil as ou
import Assignment5 as as5



assn = "Assignment 10"
def main():
    comments, queries = as5.read_queries("Assignment10.sql")
    as5.process_queries(comments, queries, "udb", assn)

    comments, queries = as5.read_queries("Analytics.sql")
    as5.process_queries(comments, queries, "udb", f"{assn}-Analytics")

if __name__ == "__main__":
    main()