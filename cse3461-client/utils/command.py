class Command:
    def __init__(self, action: str, data):
        self.action = action
        self.data = data


def shutdown():
    return Command('shutdown', None)


def view(filename=None):
    if not filename:
        print('Please enter a filename')
        filename = f'{input()}.todo'
    return Command('open', {
        'filename': filename
    })


def add_todo(filename):
    print('What do you want to add todo?')
    new_entry = input()
    return Command('add', {
        'filename': filename,
        'todo': new_entry
    })


def delete_todo(filename, todo_no):
    return Command('delete_todo', {
        'filename': filename,
        'line_no': todo_no
    })


def delete_list(filename):
    return Command('delete_list', {
        'filename': filename
    })
