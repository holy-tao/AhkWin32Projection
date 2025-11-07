#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Adds every element in *ATensor* to its corresponding element in *BTensor* and places the result into the corresponding element of *OutputTensor*, with the option for fused activation.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_element_wise_add1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_ADD1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the left-hand side inputs.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ATensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the right-hand side inputs.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the addition.
     * 
     * Fused activation may be used only when the output datatype is **FLOAT16** or **FLOAT32**.
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    FusedActivation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
