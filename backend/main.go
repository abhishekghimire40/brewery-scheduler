package main

import (
	"brewery-scheduler/routes"
	"log"
	"os"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
)

func main() {
	var port string
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	port = os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	router := gin.Default()
	router.Use(gin.Logger())

	// Custom CORS configuration to allow requests from frontend
	corsConfig := cors.Config{
		AllowAllOrigins: true,
		// AllowOrigins:     []string{"http://localhost:3000"}, // Allow only frontend origin
		AllowMethods: []string{
			"GET",
			"POST",
			"PUT",
			"DELETE",
			"OPTIONS",
		}, // Allowed methods
		AllowHeaders: []string{
			"Origin",
			"Content-Type",
			"Authorization",
			"token",
		}, // Allowed headers
		ExposeHeaders: []string{
			"Content-Length",
		}, // Expose specific headers
		AllowCredentials: true, // Allow credentials like cookies
	}
	router.Use(cors.New(corsConfig))
	routes.BuildRouter(router)

	// running the server on port 8080
	err = router.Run(":" + port)
	if err != nil {
		log.Fatal("Error starting the server ")
	}
}
