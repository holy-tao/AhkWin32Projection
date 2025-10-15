#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_CALLBACK_COOKIE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pcwszName{
        get {
            if(!this.HasProp("__pcwszName"))
                this.__pcwszName := PWSTR(this.ptr + 0)
            return this.__pcwszName
        }
    }

    /**
     * @type {PWSTR}
     */
    pcwszValue{
        get {
            if(!this.HasProp("__pcwszValue"))
                this.__pcwszValue := PWSTR(this.ptr + 8)
            return this.__pcwszValue
        }
    }

    /**
     * @type {PWSTR}
     */
    pcwszDomain{
        get {
            if(!this.HasProp("__pcwszDomain"))
                this.__pcwszDomain := PWSTR(this.ptr + 16)
            return this.__pcwszDomain
        }
    }

    /**
     * @type {PWSTR}
     */
    pcwszPath{
        get {
            if(!this.HasProp("__pcwszPath"))
                this.__pcwszPath := PWSTR(this.ptr + 24)
            return this.__pcwszPath
        }
    }

    /**
     * @type {FILETIME}
     */
    ftExpires{
        get {
            if(!this.HasProp("__ftExpires"))
                this.__ftExpires := FILETIME(this.ptr + 32)
            return this.__ftExpires
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
