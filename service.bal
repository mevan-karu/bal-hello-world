import ballerina/http;
import ballerina/log;

type InterestRate readonly & record  {
    string month;
    string rate;
};

service / on new http:Listener(9090) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting() returns @http:Cache {maxAge: 300} string {
        log:printInfo("returning from service");
        return "Hello, World!";
    }

    resource function get interestRate/[string month]() returns @http:Cache {maxAge: 300} InterestRate|error {
        log:printInfo("returning from service");
        InterestRate ir = {month: month, rate: "5.5"};
        return ir;
    }
}
