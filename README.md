# Pokemon API

### Dependencies

- Ruby 3.0.X
- Bundler 2.2.X

## Docker
### Dependencies

- [Docker](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Pokemon API is very easy to install and deploy in a Docker container.

### Starting server


 - **Step 01:** Clone project
	```
	git clone https://github.com/GleisonAndrade/pokemon-api.git
	cd pokemon-api
	```
 - **Step 02:** Builds project images
	 ```
	 docker-compose build
	 ```
 - **Step 03:** Boots up the app
	 ```
	 docker-compose up
	 ```
 - **Step 04:** Verify the deployment by navigating to your server address in your preferred browser.

	```
	http://localhost:3000/api/pokemons/bulbasaur
	```
**Result:** ["chlorophyll","overgrow"]
