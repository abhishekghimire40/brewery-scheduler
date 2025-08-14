package controllers

import (
	"brewery-scheduler/api"
	"context"
)

type APIController struct{}

var _ api.StrictServerInterface = (*APIController)(nil)

func (c *APIController) GetSchedule(ctx context.Context, req api.GetScheduleRequestObject) (api.GetScheduleResponseObject, error) {
	return api.GetSchedule200JSONResponse{
		Message: "Welcome to schlafy Brewery",
		Week:    req.Params.Week.Weekday().String(),
	}, nil
	// return nil, nil
}

func (c *APIController) Signup(ctx context.Context, req api.SignupRequestObject) (api.SignupResponseObject, error) {
	return nil, nil
}

func (c *APIController) Login(ctx context.Context, req api.LoginRequestObject) (api.LoginResponseObject, error) {
	return nil, nil
}
