package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

type MyEvent struct {
	Name string `json:"name"`
}

type Response struct {
	Message string `json:"message"`
}

func HandleRequest(ctx context.Context, event MyEvent) (Response, error) {
	message := fmt.Sprintf("Olá %s, você esta testando a poc de lambda com terraform", event.Name)
	return Response{message}, nil
}

func main() {
	lambda.Start(HandleRequest)
}
