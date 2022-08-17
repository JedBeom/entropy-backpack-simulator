import numpy as np
import random
import time

room = np.zeros((100, 100))

def print_room():
    for x in room:
        print(end="|")
        for y in x:
            if y == 0:
                print(" ", end="|")
            else:
                print(int(y), end="|")
        print()
    print()

class Backpack():
    def __init__(self, num, x, y):
        self.num = num
        self.x = x
        self.y = y

        room[x][y] = self.num

    def location(self):
        return (num, self.x, self.y)

    def move(self, x, y):
        room[self.x][self.y] = 0
        new_x = self.x + x
        new_y = self.y + y
        if new_x < 0 or new_x > 99:
            new_x = self.x - x
        if new_y < 0 or new_y > 99:
            new_y = self.y - y

        self.x = new_x
        self.y = new_y
        room[self.x][self.y] = self.num
         
    def move_random_one(self):
        a = random.randint(1, 4)
        if a == 1:
            self.move(0, 1)
        elif a == 2:
            self.move(1, 0)
        elif a == 3:
            self.move(0, -1)
        elif a == 4:
            self.move(-1, 0)

num = 1
backpacks = list()
for i in range(0, 100, 10):
    backpacks.append(Backpack(i, i))

print("초기 모습\n")
print_room()

time.sleep(3)

for n in range(1,6000001):
    for b in backpacks:
        b.move_random_one()

    if n%10==0:
        print(f"[{n}번째 시행]\n")
        print_room()

        for b in backpacks:
            print(b.location())

        print("\n\n\n")
        time.sleep(0.1)
