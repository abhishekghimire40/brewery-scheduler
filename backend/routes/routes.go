package routes

import (
	"brewery-scheduler/api"
	"brewery-scheduler/controllers"
	"log"

	"github.com/gin-gonic/gin"
	ginmiddleware "github.com/oapi-codegen/gin-middleware"
)

func BuildRouter(r *gin.Engine) {
	swagger, err := api.GetSwagger()
	if err != nil {
		log.Fatalf("failed to load embedded OpenAPI spec: %v", err)
	}

	// general error when the request doesn't reach the handlers
	opts := &ginmiddleware.Options{
		ErrorHandler: func(c *gin.Context, message string, statusCode int) {
			log.Printf("OpenAPI validation error %d %s %s: %s", statusCode, c.Request.Method, c.Request.URL.Path, message)
			c.AbortWithStatusJSON(statusCode, api.Error{
				Code:    "invalid_input",
				Message: "Request  doesn't match api contract",
			})
		},
	}
	r.Use(ginmiddleware.OapiRequestValidatorWithOptions(swagger, opts))

	ctr := &controllers.APIController{}

	strict := api.NewStrictHandler(ctr, nil)
	api.RegisterHandlers(r, strict)
}
