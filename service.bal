import ballerina/http;
import ballerina/log;

service / on new http:Listener(9090) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting(string name) returns string {
        log:printInfo("returning from service");
        return string `Hello, World ${name}!`;
    }
}
