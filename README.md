# README

### Installation

0. Build images
   <code>$ make build</code>

1. Launch Docker  
   <code>$ make up</code>

2. Install vendors and check everything is fine  
   <code>$ make install</code>

3. Load fixtures and launch tests  
   <code>$ make ci</code>
   

    npm init -y
    npm install -D yarn typescript@4.1.3 eslint@7.18.0 esbuild
    -D = --save-dev
    -P = --save-prod
    
    npm install express --save
    npm install -D @types/express

    chokidar  // file watcher
    node-ts   // support ts  dans node sans besoin de compiler en js

# Init typescript
    tsc --init

# Init Configuration lint
    ./node_modules/.bin/eslint --init

# Launch app
    npm run-script start

# Run a compile based on a backwards look through the fs for a tsconfig.json
    tsc

# Run transpilation with esbuild
    npm run-script build
