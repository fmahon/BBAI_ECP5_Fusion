#!python
import click


@click.group()
def main():
    pass

@main.command()
@click.argument('command')
def make(command):
    """ TODO : complete help   """
    print("make : ...",command)


if __name__ == "__main__":
    main()
