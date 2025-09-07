#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ONEX_VARIABLE_BLOB.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_USER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    authIdentity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {ONEX_VARIABLE_BLOB}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := ONEX_VARIABLE_BLOB(this.ptr + 8)
            return this.__UserName
        }
    }

    /**
     * @type {ONEX_VARIABLE_BLOB}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := ONEX_VARIABLE_BLOB(this.ptr + 16)
            return this.__DomainName
        }
    }
}
