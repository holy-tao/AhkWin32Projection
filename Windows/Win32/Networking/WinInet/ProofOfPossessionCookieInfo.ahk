#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class ProofOfPossessionCookieInfo extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PWSTR(this.ptr + 0)
            return this.__name
        }
    }

    /**
     * @type {PWSTR}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := PWSTR(this.ptr + 8)
            return this.__data
        }
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    p3pHeader{
        get {
            if(!this.HasProp("__p3pHeader"))
                this.__p3pHeader := PWSTR(this.ptr + 24)
            return this.__p3pHeader
        }
    }
}
