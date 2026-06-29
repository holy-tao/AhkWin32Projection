#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class KCRM_PROTOCOL_BLOB extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ProtocolId {
        get {
            if(!this.HasProp("__ProtocolId"))
                this.__ProtocolId := Guid(0, this)
            return this.__ProtocolId
        }
    }

    /**
     * @type {Integer}
     */
    StaticInfoLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TransactionIdInfoLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Unused1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Unused2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
