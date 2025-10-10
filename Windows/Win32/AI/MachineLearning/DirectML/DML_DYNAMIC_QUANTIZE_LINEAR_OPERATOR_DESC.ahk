#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_DYNAMIC_QUANTIZE_LINEAR_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

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
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputScaleTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputZeroPointTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
