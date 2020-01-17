#Reserve
import parking as pk
class ParkingArea:
    def __init__(self):
        pk1 = pk.Parking()
        pk2 = pk.Parking()
        pk3 = pk.Parking()
        pk4 = pk.Parking()
        self.__area = []
        self.__area.append(pk1)
        self.__area.append(pk2)
        self.__area.append(pk3)
        self.__area.append(pk4)

    def getParking(self, position):
        return self.__area[position]
    
    def park(self):
        return self.__area
    
    def getAvailable(self):
        count = 0
        for i in self.__area:
            if i.getReserved() == False:
                count += 1
        return count, "parks are available"

    def setParking(self, position, newParking):
        self.__area[position - 1] =  newParking

    def __str__(self):
        return f"Parking 1: {self.__area[0].checkReserved()}\nParking 2: {self.__area[1].checkReserved()}\nParking 3: {self.__area[2].checkReserved()}\nParking 4: {self.__area[3].checkReserved()}"

    def delete(self,position):
        self.__area.pop(position - 1)
        print("You checked out successfully")
        newpk = pk.Parking()
        self.__area.append(newpk)
