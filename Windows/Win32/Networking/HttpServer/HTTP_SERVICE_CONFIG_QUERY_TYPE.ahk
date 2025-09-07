#Requires AutoHotkey v2.0.0 64-bit

/**
 * The HTTP_SERVICE_CONFIG_QUERY_TYPE enumeration type defines various types of queries to make. It is used in the HTTP_SERVICE_CONFIG_SSL_QUERY, HTTP_SERVICE_CONFIG_SSL_CCS_QUERY, and HTTP_SERVICE_CONFIG_URLACL_QUERY structures.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_config_query_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_QUERY_TYPE{

    /**
     * The query returns a single record that matches the specified key value.
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigQueryExact => 0

    /**
     * The query iterates through the store and returns all records in sequence, using an index value that the calling process increments between query calls.
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigQueryNext => 1

    /**
     * Terminates the enumeration; is not used to define a query type.
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigQueryMax => 2
}
