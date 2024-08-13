import ballerina/http;
import ballerina/log;

type InterestRate readonly & record  {
    string month;
    string rate;
};

type HttpHeader record {
    string headerName;
    string headerValue;
};

public configurable HttpHeader[] headers = [];

service / on new http:Listener(9091) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting() returns http:Response {
        log:printInfo("returning from service");
        http:Response response = new;
        foreach var header in headers {
            response.setHeader(header.headerName, header.headerValue);
        }
        response.setTextPayload("Hello, World!");
        return response;
    }
}
