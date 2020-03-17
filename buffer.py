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


n = 100 #buffer size
fs = 2000 #sample frequency
f = 200 #signal frequency
sample = 200 #samples
x = [0] * sample #input signal


buf = RingBuffer(n)

for i in range(sample):
    buf.append(math.sin(2 * math.pi * f * i / fs))

#print(buf.get())
plt.plot(buf.get())
plt.show()


