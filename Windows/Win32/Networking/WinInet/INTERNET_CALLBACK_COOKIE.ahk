#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
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
     * @type {Pointer<Char>}
     */
    pcwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszDomain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
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
