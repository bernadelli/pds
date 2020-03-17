import matplotlib.pyplot as plt
import math

class RingBuffer:
    def __init__(self, size):
        self.data = [None for i in range(size)]

    def append(self, x):
        self.data.pop(0)
        self.data.append(x)

    def get(self):
        return self.data[::-1]
        #return self.data


n = 100
fs = 2000
f = 200
sample = 200
x = [0] * sample


buf = RingBuffer(n)

for i in range(sample):
    buf.append(math.sin(2 * math.pi * f * i / fs))

#print(buf.get())
plt.plot(buf.get())
plt.show()


