#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CREDSSP_CRED.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CREDSSP_CRED_EX extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {CREDSSP_CRED}
     */
    Cred{
        get {
            if(!this.HasProp("__Cred"))
                this.__Cred := CREDSSP_CRED(16, this)
            return this.__Cred
        }
    }
}
