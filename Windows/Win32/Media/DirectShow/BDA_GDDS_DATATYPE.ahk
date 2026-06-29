#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_GDDS_DATATYPE extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    uuidDataType {
        get {
            if(!this.HasProp("__uuidDataType"))
                this.__uuidDataType := Guid(4, this)
            return this.__uuidDataType
        }
    }
}
