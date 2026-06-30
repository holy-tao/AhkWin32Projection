#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDANODE_DESCRIPTOR extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulBdaNodeType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidFunction {
        get {
            if(!this.HasProp("__guidFunction"))
                this.__guidFunction := Guid(4, this)
            return this.__guidFunction
        }
    }

    /**
     * @type {Guid}
     */
    guidName {
        get {
            if(!this.HasProp("__guidName"))
                this.__guidName := Guid(20, this)
            return this.__guidName
        }
    }
}
