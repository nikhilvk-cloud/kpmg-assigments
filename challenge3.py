def getKeyVal(obj: dict):
    keys = list(obj)
    print(keys)
    if len(keys) != 1:
        raise Exception('Wrong input')
    else:
        return keys[0]


def getNestedValue(obj: dict, key: str, isFound = False):
    if type(obj) is not dict and not isFound:
        return None
    if (isFound or (key in obj.keys())) :
        if type(obj[key]) is dict:
            return getNestedValue(obj[key], getKeyVal(obj[key]), True)
        else:
            return obj[getKeyVal(obj)]
    else:
        nestedKey = getKeyVal(obj)
        return getNestedValue(obj[nestedKey], key, False)

if __name__ == '__main__':
    obj = {'a': {'b': {'c': 'd'}}}
    value = getNestedValue(obj, 'c')
    print(value) #d