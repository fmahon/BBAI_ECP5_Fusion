#!python
import click
import os

progname = "bbaiecp5fusion"
workdir  = "/app"

    
def execute_cmd_in_docker(cmd):
    docker_exec = "docker run -w {} --mount type=bind,source=\"$(pwd)\",target={} -it {} {}".format(workdir, workdir, progname, cmd)
    os.system(docker_exec)

def build_docker_image():
    print("Build docker image ... ")
    cmd = "docker build -t {} . ".format(progname)
    os.system(cmd);

    execute_cmd_in_docker('pipenv install');

def build_fpga_bitfile():
    execute_cmd_in_docker("ls -l")
    
@click.group()
def main():
    pass

@main.command()
def all():
    build_docker_image()
    build_fpga_bitfile()

if __name__ == "__main__":
    main()
