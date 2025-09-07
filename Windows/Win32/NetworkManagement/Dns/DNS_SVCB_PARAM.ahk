#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_SVCB_PARAM extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    wSvcParamKey {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Pointer<DNS_SVCB_PARAM_IPV4>}
     */
    pIpv4Hints {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }

    /**
     * @type {Pointer<DNS_SVCB_PARAM_IPV6>}
     */
    pIpv6Hints {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }

    /**
     * @type {Pointer<DNS_SVCB_PARAM_MANDATORY>}
     */
    pMandatory {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }

    /**
     * @type {Pointer<DNS_SVCB_PARAM_ALPN>}
     */
    pAlpn {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    wPort {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Pointer<DNS_SVCB_PARAM_UNKNOWN>}
     */
    pUnknown {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }

    /**
     * @type {PSTR}
     */
    pszDohPath{
        get {
            if(!this.HasProp("__pszDohPath"))
                this.__pszDohPath := PSTR(this.ptr + 2)
            return this.__pszDohPath
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }
}
