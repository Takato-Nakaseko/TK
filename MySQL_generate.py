import csv

#This program reads every row from csv file and write SQL syntax into txt file

#Read csv file. Change file name if needed.
with open("data.csv", "r") as cs:
    reader = csv.reader(cs)
    memberList = []
    for row in reader:
        memberList.append(row)

#input database name and table name
#dataBase = str(input("Enter data base name: "))
table = input("Enter table name: ")
attempt = False
while attempt == False:
    try:
        rows = int(input("How many rows do you need?: ")) 
    except:
        print("Enter a valid number. Try again.")
    else:
        attempt = True
        
#documenting SQL syntax in txt file.
with open("member.txt", "w") as f:

#Creating table, but optional. Uncomment to use it
    #for i in range(1):
        #f.write("CREATE TABLE " + dataBase + "." + table + "(\n")
        #for i in memberList[0]:
            #f.write("\t" + i + "\n")
    #f.write(");")
    #f.write("\n")

#Insert data
#Fix the first for loop range for rows and table name to make it work
#Also change number of column for another table
    f.write("INSERT INTO Members")
    f.write("(" + ', '.join(memberList[0][1::]) + ")\n")  #showing column name excluding AUTO INCREMENT column.
    f.write("VALUES\n")
    for i in range(1, rows):
        f.write("\t(")
        for j in range(1, len(memberList[i])-1):         
            f.write("'" + memberList[i][j] + "', " )
        f.write("'" + memberList[i][-1] + "'" + "),\n")

#For the last row
    f.write("\t(")
    for k in range(1, len(memberList[rows])-1):            
        f.write("'" + memberList[rows][k] + "'" + ", ")
    f.write("'" + memberList[rows][-1] + "'" + ");")
    
