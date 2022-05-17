speed=0.03
cuantity=15
numColums=80

colorArray=`seq 1 $numColums`
for i in $(seq 1 $numColums);do
	colorArray[$i]=$((RANDOM%6))
done


for j in {1..1000};do
	line=""
for i in $(seq 1 $numColums); do
	color=$((16+(${colorArray[$i]}*6)))
	line+="\e[38;5;${color}m$((RANDOM%10))\e[0m"
	if [ ${colorArray[$i]} -eq 0 ];
	then
		if [ $((RANDOM%$cuantity)) = 3 ];
		then
			colorArray[$i]=1
		fi
	else	
		colorArray[$i]=$(((${colorArray[$i]}+1)%6))
	fi
done;
echo -e $line
sleep $speed
done

