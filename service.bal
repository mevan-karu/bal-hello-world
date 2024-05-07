import ballerina/http;

configurable int port = 9090;

service / on new http:Listener(port) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting() returns string {
        return "Hello, World!";
    }
}
