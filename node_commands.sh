// node version update
//install node version manager n

sudo npm install -g n
// update to the latest version

sudo n stable

// Print prettified json
node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, '\t'));" \
  '{ "foo":"bar", "foo2":"bar2"}'

// Apache bench
ab -n 1000 -c 100 https://localhost:8888/
