#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_SVCB_PARAM_ALPN_ID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_SVCB_PARAM_ALPN extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cIds {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {DNS_SVCB_PARAM_ALPN_ID}
     */
    rgIds {
        get {
            if(!this.HasProp("__rgIdsProxyArray"))
                this.__rgIdsProxyArray := Win32FixedArray(this.ptr + 8, 1, DNS_SVCB_PARAM_ALPN_ID, "")
            return this.__rgIdsProxyArray
        }
    }
}
