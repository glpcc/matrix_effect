
colorArray=`seq 80`
for i in {1..80};do
	colorArray[$i]=$((RANDOM%6))
done

echo ${colorArray[@]} 

for j in {1..1000};do
	line=""
for i in {1..80}; do
	color=$((16+(${colorArray[$i]}*6)))
	line+="\e[38;5;${color}m$((RANDOM%10))\e[0m"
	if [ ${colorArray[$i]} -eq 0 ];
	then
		if [ $((RANDOM%15)) = 3 ];
		then
			colorArray[$i]=1
		fi
	else	
		colorArray[$i]=$(((${colorArray[$i]}+1)%6))
	fi
done;
echo -e $line
sleep 0.03
done

