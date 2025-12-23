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

    static packingSize => 4

    /**
     * @type {Integer}
     */
    authIdentity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * This bitfield backs the following members:
     * - fUserName
     * - fDomainName
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    fUserName {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fDomainName {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * @type {ONEX_VARIABLE_BLOB}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := ONEX_VARIABLE_BLOB(8, this)
            return this.__UserName
        }
    }

    /**
     * @type {ONEX_VARIABLE_BLOB}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := ONEX_VARIABLE_BLOB(16, this)
            return this.__DomainName
        }
    }
}
