const fs = require('fs')

const output  = fs.createWriteStream('data.sql')

const createUserInsertIntoQuery = ({ username}) => {
    return `INSERT INTO users (username) VALUES ('${username}');\n`
}

async function waitForDrain(stream) {
    await new Promise((resolve) => stream.once('drain', resolve))
}

async function main() {
    
    for (let i = 0; i < 1000000; i++) {
        const queryForDBIndexed = createUserInsertIntoQuery({ username: `user_${i}`})
        if (!output.write(queryForDBIndexed)) await waitForDrain(output)
    }
    output.end()
}

main()