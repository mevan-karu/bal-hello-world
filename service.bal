import ballerina/http;
import ballerina/log;

type GreetingReq record  {
    string name;
};

type GreetingResp record {
    string greeting;
};

configurable string choreoApiKey = "";
configurable string serviceUrl = "";

http:Client greetingClient = check new(serviceUrl);

service / on new http:Listener(9090) {

    resource function post greet(@http:Payload GreetingReq greetingReq) returns GreetingResp|http:ClientError {
        log:printInfo("Invoking the greeting service");
        string response = check greetingClient->get(string `/greeting?name=${greetingReq.name}`, {"choreo-api-key": choreoApiKey});
        return {greeting: response};
    }
}
