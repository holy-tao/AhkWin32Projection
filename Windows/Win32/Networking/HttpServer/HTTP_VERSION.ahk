#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a version of the HTTP protocol that a request requires or a response provides.
 * @remarks
 * For more information about the HTTP protocol, see 
 * <a href="https://www.ietf.org/rfc/rfc2616.txt">RFC 2616</a>.
 * 
 * The following macros define various versions of the HTTP protocol:"#define HTTP_VERSION_UNKNOWN    { 0, 0 }""#define HTTP_VERSION_0_9        { 0, 9 }""#define HTTP_VERSION_1_0        { 1, 0 }""#define HTTP_VERSION_1_1        { 1, 1 }"
 * 
 * The HTTP Server API provides a number of macros that can be used to evaluate the value of an HTTP_VERSION structure; For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Http/http-server-api-version-1-0-macros">HTTP Server API Version 1.0 Macros</a>.
 * 
 * <div class="alert"><b>Note</b>  The HTTP Server API rejects a version of HTTP larger than 65,535 in either the major or minor portion. If a request includes such a version number, the HTTP Server API discards it and returns a response with status 400 ("Bad Request").</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_version
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_VERSION {
    #StructPack 2

    /**
     * Major version of the HTTP protocol.
     */
    MajorVersion : UInt16

    /**
     * Minor version of the HTTP protocol.
     */
    MinorVersion : UInt16

}
