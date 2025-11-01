#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 72

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
    ScaleTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BiasTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    FusedAddTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputMeanTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputVarianceTensor {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Float}
     */
    Epsilon {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    FusedActivation {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
