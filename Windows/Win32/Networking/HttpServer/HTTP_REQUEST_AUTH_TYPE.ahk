#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HTTP_REQUEST_AUTH_TYPE enumeration defines the authentication types supported by the HTTP Server API.This enumeration is used in the HTTP_REQUEST_AUTH_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_request_auth_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_AUTH_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No authentication is attempted for the request.
     * @type {Integer (Int32)}
     */
    static HttpRequestAuthTypeNone => 0

    /**
     * Basic authentication is attempted for the request.
     * @type {Integer (Int32)}
     */
    static HttpRequestAuthTypeBasic => 1

    /**
     * Digest authentication is attempted for the request.
     * @type {Integer (Int32)}
     */
    static HttpRequestAuthTypeDigest => 2

    /**
     * NTLM authentication is attempted for the request.
     * @type {Integer (Int32)}
     */
    static HttpRequestAuthTypeNTLM => 3

    /**
     * Negotiate authentication is attempted for the request.
     * @type {Integer (Int32)}
     */
    static HttpRequestAuthTypeNegotiate => 4

    /**
     * Kerberos authentication is attempted for the request.
     * @type {Integer (Int32)}
     */
    static HttpRequestAuthTypeKerberos => 5
}
