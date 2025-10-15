#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ENDPOINTADDRESS2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    serviceUrl{
        get {
            if(!this.HasProp("__serviceUrl"))
                this.__serviceUrl := PWSTR(this.ptr + 0)
            return this.__serviceUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    policyUrl{
        get {
            if(!this.HasProp("__policyUrl"))
                this.__policyUrl := PWSTR(this.ptr + 8)
            return this.__policyUrl
        }
    }

    /**
     * @type {Integer}
     */
    identityType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    identityBytes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
