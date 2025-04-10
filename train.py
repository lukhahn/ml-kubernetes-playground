from sklearn.linear_model import LogisticRegression
import pickle

X = [[0], [1], [2], [3]]
y = [0, 0, 1, 1]

model = LogisticRegression()
model.fit(X,y)

with open("model.pkl", "wb") as f:
    pickle.dump(model,f)

