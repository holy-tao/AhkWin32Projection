#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_WMDRMTUNER_PIDPROTECTION extends Win32Struct {
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
    uuidKeyID {
        get {
            if(!this.HasProp("__uuidKeyID"))
                this.__uuidKeyID := Guid(4, this)
            return this.__uuidKeyID
        }
    }
}
