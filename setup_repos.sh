find . -type f -exec sed -i 's/landon-hotel-kevin/'$3'/g' {} +

for dir in */; do

    git config --global user.email "$1"
    git config --global user.name "$2"
	
    git -C $dir init
    git -C $dir checkout -b main
    git -C $dir add .
    git -C $dir commit -m "Initial Setup"

    cd $dir && gh repo create $3/${dir%?} --confirm --private && cd ..

    git -C $dir push -u origin main
    echo "$dir"
done

