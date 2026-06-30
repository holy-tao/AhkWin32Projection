#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MLOperatorAttributeType.ahk
#Include ..\..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class MLOperatorAttribute extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {MLOperatorAttributeType}
     */
    type {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    required {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }
}
