# About

Hello, have you heard about OAUTH2 ? And do you know what a proxy is?

In this simple, but teachable project, we can reach the main concepts of them. 

## How ?

Using a open source project as a auth module[Keycloak], to generate a valid Json Web Token and throw forward to a proxy[Ory Oathkeeper].

## Kong

Kong gateway can be an excellent solution for an ingress load balancer and API gateway if you do not want vendor lock-in of any cloud API Gateways in your application. Kong uses OpenResty and Lua. OpenResty extends Nginx with Lua scripting to use Nginx's event model for non-blocking I/O with HTTP clients and remote backends like PostgreSQL, Memcached, and Redis. OpenResty is not an Nginx fork, and Kong is not an Openresty fork. Kong uses OpenResty to enable API gateway features.

## Keycloak 

An excelent free auth module, wrote in Java, as we can see on its web page. [keycloak-page](https://www.keycloak.org/). 

Its over APACHE2.0 license. Thus, in case you wanna try it, read the license doc.

## Ory Oathkeeper

"Ory is the largest open source community in the world for cloud software application security". [ory-page](https://www.ory.sh/docs/welcome). 

We gonna use one of its products, the incredible proxy wrote in Golang(:heart:).

Also over APACHE2.0 license.

## What you need

Have installed _docker_ and _docker-compose_ in your system is all you need to run the project. [docker-main-page](https://docs.docker.com/engine/install/ubuntu/)

Just follow the steps to be able to run any containers you wish over the kernel layer of your system.

### Start keycloak
```
cd keycloak

docker-compose up --build
```

### Save jwks file in oath-image folder
```
 Open __http://localhost:8080/realms/master/protocol/openid-connect/certs__ save as jwks.json in oath-image folder
```

### Creating a keycloak client

1. Let put hands on. Open your browse in _localhost:8080_ as showned below:

2. On admin console, type __admin__ as user and __admin123__ as password (set of docker-compose).

3. Lets create a client named __my-client__:

4. Turn on __Client authentication__ option in capability config

5. Get the client and secret values on _Credential_ TAB:

### Start another services and apis
```
docker-compose up
```

Done for now. Lets test the Oauth2 flow using admin user and the my-client scope.

### Testing Authorization

1. Install a UI to http request. _Postman_ and _Insomnia_ are great options.

* https://www.postman.com/
* https://insomnia.rest/

2. Lets get a valid JWT sending a POST request to:

    localhost:8080/realms/master/protocol/openid-connect/token

And using Form URL Encodend, we send:

```
    {
        username: admin,
        password: admin123,
        client_id: my-client,
        client_secret: {past_secret_here},
        grant_type: password
    }
```

3. Check if you got a __200__ status Request with a valid JWT:


* We are using OpenID Connection, what allow us make this type of requisition. 

### Testing Ory Proxy

Until this point, all we got is a functional auth module. With Ory Oathkeeper well pointed and seted by the files _jwks_ and _rules_ files, we are ready to test our embedded APIs. 

1. Lets make a GET requisition to _http://localhost:4455/cities_ with no valid token: 

2. We are passing throught Ory Proxy(:4455) to receive any response from API. If you wanna do it directly, the ports are being exposed by docker. So, we can make:

3. With a valid token on header to fill the Authorization Header, we can get the response from successfull

### Testing kong gateway

run __kong-config.sh__ 

Now you can call GET http://127.0.0.1:8000/cities and dont forget to pass authorization token in the header of request













