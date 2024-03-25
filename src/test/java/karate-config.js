function fn(){
    //define environment
    var env = karate.env;
    karate.log('karate.env system property was:', env);
    if (!env){
        env = 'dev';
    }
//    var config = {
//        env: env
//    }
var baseURL = karate.properties['baseURL'];
karate.log('baseURL:', baseURL);
if (!baseURL){
baseURL = 'https://petstore.swagger.io/v2/'
}
config = {
baseURL: baseURL,
createListURL: 'user/createWithList',

};
    karate.configure('connectTimeout',3000);
    karate.configure('readTimeout',3000);
    return config;
}