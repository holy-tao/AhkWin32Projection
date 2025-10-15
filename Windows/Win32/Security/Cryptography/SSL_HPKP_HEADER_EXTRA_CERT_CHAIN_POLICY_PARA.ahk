#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SSL_HPKP_HEADER_EXTRA_CERT_CHAIN_POLICY_PARA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    pwszServerName{
        get {
            if(!this.HasProp("__pwszServerName"))
                this.__pwszServerName := PWSTR(this.ptr + 8)
            return this.__pwszServerName
        }
    }

    /**
     * @type {Array<PSTR>}
     */
    rgpszHpkpValue{
        get {
            if(!this.HasProp("__rgpszHpkpValueProxyArray"))
                this.__rgpszHpkpValueProxyArray := Win32FixedArray(this.ptr + 16, 2, PSTR, "")
            return this.__rgpszHpkpValueProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
