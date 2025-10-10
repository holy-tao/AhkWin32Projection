#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 48

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
    InputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    CrossChannel {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    LocalSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * @type {Float}
     */
    Beta {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * @type {Float}
     */
    Bias {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }
}
