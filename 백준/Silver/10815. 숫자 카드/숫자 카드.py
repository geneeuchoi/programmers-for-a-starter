import sys
input = sys.stdin.readline

# 상근 숫자 카드 개수
N = int(input())
NList = list(map(int, input().split()))
NList.sort()

# 상근이가 가지고 있는 숫자 카드인지 아닌지 구분해야 하는 카드의 개수
M = int(input())
MList = list(map(int, input().split()))

def binary_search(arr, target):
    lo, hi = 0, len(arr) - 1
    while lo <= hi:
        mid = (lo + hi) // 2
        if arr[mid] == target:
            return True
        elif arr[mid] < target:
            lo = mid + 1
        else:
            hi = mid - 1
    return False

for x in MList:
    if binary_search(NList, x):
        print(1, end=' ')
    else:
        print(0, end=' ')
