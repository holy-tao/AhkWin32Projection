#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HTTP_REQUEST_AUTH_TYPE enumeration defines the authentication types supported by the HTTP Server API.This enumeration is used in the HTTP_REQUEST_AUTH_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_request_auth_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_REQUEST_AUTH_TYPE extends Win32Enum {

    /**
     * No authentication is attempted for the request.
     * Native name: HttpRequestAuthTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Basic authentication is attempted for the request.
     * Native name: HttpRequestAuthTypeBasic
     * @type {Integer (Int32)}
     */
    static Basic => 1

    /**
     * Digest authentication is attempted for the request.
     * Native name: HttpRequestAuthTypeDigest
     * @type {Integer (Int32)}
     */
    static Digest => 2

    /**
     * NTLM authentication is attempted for the request.
     * Native name: HttpRequestAuthTypeNTLM
     * @type {Integer (Int32)}
     */
    static TypeNTLM => 3

    /**
     * Negotiate authentication is attempted for the request.
     * Native name: HttpRequestAuthTypeNegotiate
     * @type {Integer (Int32)}
     */
    static Negotiate => 4

    /**
     * Kerberos authentication is attempted for the request.
     * Native name: HttpRequestAuthTypeKerberos
     * @type {Integer (Int32)}
     */
    static Kerberos => 5
}
