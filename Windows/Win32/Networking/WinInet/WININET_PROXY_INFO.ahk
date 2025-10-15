#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class WININET_PROXY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {BOOL}
     */
    fProxy{
        get {
            if(!this.HasProp("__fProxy"))
                this.__fProxy := BOOL(this.ptr + 0)
            return this.__fProxy
        }
    }

    /**
     * @type {BOOL}
     */
    fBypass{
        get {
            if(!this.HasProp("__fBypass"))
                this.__fBypass := BOOL(this.ptr + 4)
            return this.__fBypass
        }
    }

    /**
     * @type {Integer}
     */
    ProxyScheme {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pwszProxy{
        get {
            if(!this.HasProp("__pwszProxy"))
                this.__pwszProxy := PWSTR(this.ptr + 16)
            return this.__pwszProxy
        }
    }

    /**
     * @type {Integer}
     */
    ProxyPort {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
