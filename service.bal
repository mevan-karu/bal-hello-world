import ballerina/http;
import ballerina/log;

type GreetingReq record  {
    string name;
};

configurable string choreoApiKey = ?;
configurable string serviceUrl = ?;

http:Client greetingClient = check new(serviceUrl);

service / on new http:Listener(9090) {

    // This function responds with `string` value `Hello, World!` to HTTP GET requests.
    resource function post callGreeting(@http:Payload GreetingReq greetingReq) returns string|http:ClientError {
        log:printInfo("returning from service");
        string response = check greetingClient->get(string `/greeting?name=${greetingReq.name}`, {"choreo-api-key": choreoApiKey});
        log:printInfo("response from choreo: " + response);
        return "Hello, World!";
    }
}
