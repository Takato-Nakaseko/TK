#Parking
from datetime import *
class Parking:
    def __init__(self,name = None, phone = None, number = None, reserved = False, date = None, duration = 0):
        self.__name     = name
        self.__phone    = phone
        self.__number   = number
        self.__reserved = reserved
        self.__date     = date
        self.__duration = duration
        
    def getName(self):
        return self.__name

    def getPhone(self):
        return self.__phone

    def getNumber(self):
        return self.__number

    def getReserved(self):
        return self.__reserved

    def checkReserved(self):
        if self.__reserved == True:
            return "reserved"
        else:
            return "available"

    def getDate(self):
        return f"{self.__date.month}/{self.__date.day}/{self.__date.year}"

    def getReturnTime(self):
        expectedTime = self.__date + timedelta(hours = self.__duration)
        return f"Return time: {expectedTime.month}/{expectedTime.day} {expectedTime.hour}:{expectedTime.minute}" 
    
    def __str__(self):
        return f"Name: {self.__name}\nPhone: {self.__phone}\nNumber plate: {self.__number}\nReserved Date: {self.getDate()}"

    
        
        
    
