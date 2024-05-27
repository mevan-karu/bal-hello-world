import ballerina/http;
import ballerina/log;

service / on new http:Listener(9090) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting() returns @http:Cache {maxAge: 300} string {
        log:printInfo("returning from service");
        return "Hello, World!";
    }
}
