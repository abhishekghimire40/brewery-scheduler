package routes

import (
	"brewery-scheduler/api"
	"brewery-scheduler/controllers"

	"github.com/gin-gonic/gin"
)

func BuildRouter(r *gin.Engine) {
	ctr := &controllers.APIController{}
	api.RegisterHandlers(r, ctr)
}
