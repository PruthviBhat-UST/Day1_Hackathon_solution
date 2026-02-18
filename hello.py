import requests
from collections import Counter

url = "https://api.github.com/repos/python/cpython/pulls?state=all"

response = requests.get(url)
prs = response.json()
counts = Counter(pr['user']['login'] for pr in prs if pr.get('user'))
leaderboard = sorted(counts.items(), reverse=True) #9590851069
for user, count in leaderboard:
    print(f"{user}: {count}")

winner, top = leaderboard[0]
print(f" Winner: {winner} with {top} PRs")