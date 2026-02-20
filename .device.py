import sys
def Device():
    try:
        file = "/home/device.txt"
        device = []
        with open(file) as f:
            for line in f:
                head, cont = line.split(":")
                device.append(head)
        f.close()
        if args[1] in ["device", "number"]:
            result = []
            number = 1
            for i in device:
                if i == device[0]:
                    i = "device:   "  + i + "  => " + str(number)
                    number += 1
                    result.append(i)
                else:
                    i = "\ndevice:   "  + i + "  => " + str(number)
                    number += 1
                    result.append(i)
            if args[1] == "device":
                print(*result)
            elif args[1] == "number":
                print(len(result))
        elif args[1] == "rangein":
            return device
    except Exception:
        print("May be create device.txt Error.")

def userchoose(args):
    #args = .device.py rangein 9 <1 5 6>
    device = Device()
    max_num = int(args[2])
    args = args[3:]
    userchoose = []
    try:
        number = []
        for i in args:
            number.append(int(i))
        for i in number:
            if i <= max_num:
                choose = device[i - 1]
                userchoose.append(choose)
        print(*userchoose)
    except Exception:
        print("None")

def path(args):
    #args = .device.py path dir >userchoose<
    root = args[2]
    userchoose = args[3:]
    devnames = []
    rootnames = []
    mountroot = []
    try:
        for i in userchoose:
            names = i.split("/")
            devnames.append(names[-1])
        for i in devnames:
            name = root + "/" + i
            rootnames.append(name)
        for t in range(0,100):            
            md = rootnames[t] + " " + userchoose[t]
            mountroot.append(md)
            if devnames[-1] == devnames[t]:
                break
        print(*mountroot)
    except Exception:
        print("Error")

def exe():
    if args[1] in ["name", "number", "device"]:
        Device()
    elif args[1] == "rangein":
        userchoose(args)
    elif args[1] == "path":
        path(args)

args = sys.argv
exe()
