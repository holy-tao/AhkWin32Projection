#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs the shrink activation function on every element in *InputTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_activation_shrink_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ACTIVATION_SHRINK_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](./ns-directml-dml_tensor_desc.md)\***
     * 
     * The input tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](./ns-directml-dml_tensor_desc.md)\***
     * 
     * The output tensor to write the results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The value of the bias. A typical default for this value is 0.0.
     * @type {Float}
     */
    Bias {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The value of the threshold. A typical default for this value is 0.5.
     * @type {Float}
     */
    Threshold {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
