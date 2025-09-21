#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the necessary information to perform an mDNS query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-mdns_query_request
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class MDNS_QUERY_REQUEST extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The structure version must be **DNS_QUERY_REQUEST_VERSION1**.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    ulRefCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A string representing the name to be queried over mDNS.
     * @type {Pointer<Char>}
     */
    Query {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A value representing the type of the records to be queried. See [DNS_RECORD_TYPE](/openspecs/windows_protocols/ms-dnsp/39b03b89-2264-4063-8198-d62f62a6441a) for possible values.
     * @type {Integer}
     */
    QueryType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * A value representing the query options. **DNS_QUERY_STANDARD** is the only supported value.
     * @type {Integer}
     */
    QueryOptions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A value that contains the interface index over which the service is to be advertised. If `InterfaceIndex` is 0, then all interfaces will be considered.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a function (of type [MDNS_QUERY_CALLBACK](nc-windns-mdns_query_callback.md)) that represents the callback to be invoked asynchronously whenever mDNS results are available.
     * @type {Pointer<PMDNS_QUERY_CALLBACK>}
     */
    pQueryCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a user context.
     * @type {Pointer<Void>}
     */
    pQueryContext {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    fAnswerReceived {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    ulResendCount {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
