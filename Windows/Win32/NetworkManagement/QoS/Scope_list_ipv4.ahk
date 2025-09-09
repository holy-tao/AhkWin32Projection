#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk

/**
 * The Scope_list_ipv4 structure contains RSVP SCOPE object information.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-scope_list_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class Scope_list_ipv4 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Variable-length list of IP sender addresses, expressed as an array of <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-in_addr">IN_ADDR</a> structures.
     * @type {Array<IN_ADDR>}
     */
    scopl_ipaddr{
        get {
            if(!this.HasProp("__scopl_ipaddrProxyArray"))
                this.__scopl_ipaddrProxyArray := Win32FixedArray(this.ptr + 0, 1, IN_ADDR, "")
            return this.__scopl_ipaddrProxyArray
        }
    }
}
