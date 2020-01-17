import parking as pk
import parkingArea as pa
from datetime import *
def getName():
    name = input("Enter your name: ")
    return name

def getPhoneNumber():
    number = input("Enter your phone number: ")
    return number

def getNumberPlate():
    plate = input("Enter your car number plate: ")
    return plate

def getPosition():
    while True:
        try:
            position = int(input("Enter a parking position: "))
            while position < 0 or position > 4:
                position = int(input("Parking position is between 1 to 4: "))
        except:
            print("Error")
        else:
            break
    return position

def getReserveDuration():
    while True:
        try:
            duration = int(input("Enter how long you will reserve: "))
        except:
            print("Invalid input. Please try again")
            continue
        else:
            break
    return duration

def reserveParking():
    name        = getName()
    phone       = getPhoneNumber()
    plate       = getNumberPlate()
    duration    = getReserveDuration()
    date        = datetime.today()
    parking1    = pk.Parking(name, phone, plate, True, date, duration)
    return parking1

def showOption():
    print("1: Reserve a parking lot")
    print("2: Check checkout time")
    print("3: Check out")
    print("4: Check parking area")
    print("5: Quit")
    print()
def getOption():
    option = input("Enter the option number: ")
    while option not in "12345":
        option = input("Enter correct option number: ")
    return option

def implement(parkingArea):
    while True:  
        option = getOption()
        if option == "1":
            position = getPosition()
            allReserved = True
            park = parkingArea.park()
            for i in park:
                if i.getReserved() == False:
                    allReserved = False
            
            while allReserved == False:
                if park[position-1].getReserved() == False:
                    parking = reserveParking()
                    parkingArea.setParking(position, parking)
                    print()
                    break
                else:
                    print("It is already reserved. Please choose another parking")
                    print()
                    break
            
        elif   option == "2":
            print(parking.getReturnTime())
            
        elif option == "3":
            park = parkingArea.park()
            while True:
                try:
                    position = int(input("Please enter a parking number to checkout: "))
                    if park[position - 1].getReserved() == False:
                        print("It is not reserved")
                        break
                except:
                    print("Enter correct number")
                    continue
                else:
                    parkingArea.delete(position)
                    break
                
        elif option  == "4":
            print(parkingArea)
            
        elif option == "5":
            print("Thank you for using.")
            break
        
        else:
            print("Enter correct number")          
        
def main():
    showOption()
    parkingArea = pa.ParkingArea()
    implement(parkingArea)
    
main()
