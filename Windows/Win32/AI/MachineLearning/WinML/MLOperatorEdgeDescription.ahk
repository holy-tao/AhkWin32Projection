#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MLOperatorEdgeType.ahk
#Include .\MLOperatorTensorDataType.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class MLOperatorEdgeDescription extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {MLOperatorEdgeType}
     */
    edgeType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {MLOperatorTensorDataType}
     */
    tensorDataType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
