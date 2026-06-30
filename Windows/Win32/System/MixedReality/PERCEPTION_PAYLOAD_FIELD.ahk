#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.MixedReality
 */
class PERCEPTION_PAYLOAD_FIELD extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    FieldId {
        get {
            if(!this.HasProp("__FieldId"))
                this.__FieldId := Guid(0, this)
            return this.__FieldId
        }
    }

    /**
     * @type {Integer}
     */
    OffsetInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
