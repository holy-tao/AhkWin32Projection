#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the necessary information to perform an mDNS query.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-mdns_query_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct MDNS_QUERY_REQUEST {
    #StructPack 8

    /**
     * The structure version must be **DNS_QUERY_REQUEST_VERSION1**.
     */
    Version : UInt32

    /**
     * Reserved. Do not use.
     */
    ulRefCount : UInt32

    /**
     * A string representing the name to be queried over mDNS.
     */
    Query : PWSTR

    /**
     * A value representing the type of the records to be queried. See [DNS_RECORD_TYPE](/openspecs/windows_protocols/ms-dnsp/39b03b89-2264-4063-8198-d62f62a6441a) for possible values.
     */
    QueryType : UInt16

    /**
     * A value representing the query options. **DNS_QUERY_STANDARD** is the only supported value.
     */
    QueryOptions : Int64

    /**
     * A value that contains the interface index over which the service is to be advertised. If `InterfaceIndex` is 0, then all interfaces will be considered.
     */
    InterfaceIndex : UInt32

    /**
     * A pointer to a function (of type [MDNS_QUERY_CALLBACK](nc-windns-mdns_query_callback.md)) that represents the callback to be invoked asynchronously whenever mDNS results are available.
     */
    pQueryCallback : IntPtr

    /**
     * A pointer to a user context.
     */
    pQueryContext : IntPtr

    /**
     * Reserved. Do not use.
     */
    fAnswerReceived : BOOL

    /**
     * Reserved. Do not use.
     */
    ulResendCount : UInt32

}
