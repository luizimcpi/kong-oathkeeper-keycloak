package main

import (
	"api-comp/src/controllers"

	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.Default()

	r.GET("/cities", controllers.GetCities)

	r.Run()
}
