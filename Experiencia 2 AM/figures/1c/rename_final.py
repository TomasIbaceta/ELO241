import os
#change the current working directory to the script directory.
abspath = os.path.abspath(__file__)
dname = os.path.dirname(abspath)
os.chdir(dname)

path=dname
# path = r"E:\Github\08.LabDeTeleco\ELO241\Experiencia 2\figuras"
# os.chdir(path)
files = os.listdir()

print(os.getcwd())

for index, file in enumerate(files):
    if file.endswith(".fig"):
        dots=file.count('.')
        file2 = file.replace('.', '_', dots-1) #takes all dots except the last.
        print(file2)
        os.rename(f"{path}\\{file}", f"{path}\\{file2}")
print("endpoint")