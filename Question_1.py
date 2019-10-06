Color_1=[12,23,14]
Color_2=[10,30,15]
Color_3=[16,22,35]
Color_4=[14,24,20]
A=int(input("Enter the floor Area:"))
Total_list=[A]
index_list=[]
for i in range(0,3):
    for j in range(0,3):
        for k in range(0,3):
            for l in range (0,3):
                total=Color_1[i]+Color_2[j]+Color_3[k]+Color_4[l]
                if total>=A:
                    Total_list.append(total)
                    index_list.append([i,j,k,l])
Total_list.remove(Total_list[0])
minimum_total=min(Total_list)
shades=index_list[Total_list.index(minimum_total)]
print("Color shades:",[(0,shades[0]),(1,shades[1]),(2,shades[2]),(3,shades[3])])
print("Amount of wastage:",minimum_total-A)
