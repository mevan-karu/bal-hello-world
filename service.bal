import ballerina/http;

service / on new http:Listener(9090) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function get greeting() returns @http:Cache {maxAge: 300} string {
        return "Hello, World!";
    }
}
