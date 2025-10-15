#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_CREDENTIALS extends Win32Struct
{
    static sizeof => 56

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
     * @type {Integer}
     */
    dwPort {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwScheme {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {PWSTR}
     */
    lpcwszUrl{
        get {
            if(!this.HasProp("__lpcwszUrl"))
                this.__lpcwszUrl := PWSTR(this.ptr + 16)
            return this.__lpcwszUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    lpcwszRealm{
        get {
            if(!this.HasProp("__lpcwszRealm"))
                this.__lpcwszRealm := PWSTR(this.ptr + 24)
            return this.__lpcwszRealm
        }
    }

    /**
     * @type {BOOL}
     */
    fAuthIdentity{
        get {
            if(!this.HasProp("__fAuthIdentity"))
                this.__fAuthIdentity := BOOL(this.ptr + 32)
            return this.__fAuthIdentity
        }
    }

    /**
     * @type {PWSTR}
     */
    lpcwszUserName{
        get {
            if(!this.HasProp("__lpcwszUserName"))
                this.__lpcwszUserName := PWSTR(this.ptr + 40)
            return this.__lpcwszUserName
        }
    }

    /**
     * @type {PWSTR}
     */
    lpcwszPassword{
        get {
            if(!this.HasProp("__lpcwszPassword"))
                this.__lpcwszPassword := PWSTR(this.ptr + 48)
            return this.__lpcwszPassword
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pAuthIdentityOpaque {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
