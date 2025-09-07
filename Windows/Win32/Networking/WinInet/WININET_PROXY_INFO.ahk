#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
     * @type {Integer}
     */
    fProxy {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fBypass {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
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
