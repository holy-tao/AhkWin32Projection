#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_SERVER_CONNECTION_STATE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    lpcwszHostName{
        get {
            if(!this.HasProp("__lpcwszHostName"))
                this.__lpcwszHostName := PWSTR(this.ptr + 0)
            return this.__lpcwszHostName
        }
    }

    /**
     * @type {BOOL}
     */
    fProxy{
        get {
            if(!this.HasProp("__fProxy"))
                this.__fProxy := BOOL(this.ptr + 8)
            return this.__fProxy
        }
    }

    /**
     * @type {Integer}
     */
    dwCounter {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwConnectionLimit {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwAvailableCreates {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwAvailableKeepAlives {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwActiveConnections {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    dwWaiters {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
