package controllers

import (
	"brewery-scheduler/api"

	"github.com/gin-gonic/gin"
)

type APIController struct{}

func (c *APIController) GetSchedule(ctx *gin.Context, params api.GetScheduleParams) {
	resp := api.ScheduleResponse{
		Message: "Hello from Schlafly Brewery",
		Week:    params.Week.String(),
	}
	ctx.JSON(200, resp)
}
