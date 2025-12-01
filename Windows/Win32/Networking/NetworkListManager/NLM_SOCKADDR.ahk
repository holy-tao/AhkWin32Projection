#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * NLM_SOCKADDR structure contains the IPv4/IPv6 destination address.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ns-netlistmgr-nlm_sockaddr
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_SOCKADDR extends Win32Struct
{
    static sizeof => 128

    static packingSize => 1

    /**
     * An IPv4/IPv6 destination address.
     * @type {Array<Byte>}
     */
    data{
        get {
            if(!this.HasProp("__dataProxyArray"))
                this.__dataProxyArray := Win32FixedArray(this.ptr + 0, 128, Primitive, "char")
            return this.__dataProxyArray
        }
    }
}
