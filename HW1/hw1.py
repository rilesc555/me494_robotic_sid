from re import X
import numpy as np
import matplotlib.pyplot as plt

# Problem 2

N = 100
u: np.ndarray = np.linspace(0, 1, N)
y = np.tan(u * 0.9 * np.pi / 2)

params: dict = {}

def create_X(n):
    # Create the X matrix. N rows, n+1 columns. First n columns are u^n, u^(n-1), etc..., last column is 1
    X = np.zeros((N, n+1))
    for i in range(0, n+1):
        X[:, i] = u.T**(i)
    return X

for i in range(1, 21):
    X = create_X(i)
    theta_hat = np.linalg.inv(X.T @ X) @ X.T @ y
    params[i] = theta_hat
    print(np.linalg.inv(X.T @ X) @ X.T @ X)

fig = plt.figure()
ax = fig.add_subplot(111)
plots = [1, 5, 10, 15]

ax.plot(u, y, label='True Data')
for order in plots:
    y_hat = create_X(order) @ params[order]
    ax.plot(u, y_hat, label=f'Order: {order}')
ax.legend()

plt.show()








# %%
