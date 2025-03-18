dc_op_list=($(awk -F, 'NR>1 {print $2}' new2.csv))

# Print the list
echo "${dc_op_list[@]}"