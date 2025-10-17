#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_PADDING1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PaddingMode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PaddingValueDataType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {DML_SCALAR_UNION}
     */
    PaddingValue{
        get {
            if(!this.HasProp("__PaddingValue"))
                this.__PaddingValue := DML_SCALAR_UNION(24, this)
            return this.__PaddingValue
        }
    }

    /**
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    StartPadding {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    EndPadding {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
