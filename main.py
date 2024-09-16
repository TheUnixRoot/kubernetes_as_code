def handler(event):
    print(f'Hi, {event["name"]}')  # Press Ctrl+F8 to toggle the breakpoint.


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    subject = input("Hey what's your name?")
    handler({"name": subject})

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
