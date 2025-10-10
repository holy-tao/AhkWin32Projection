#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Checks each element of *InputTensor* for IEEE-754 -inf, inf, or both, depending on the given *InfinityMode*, and places the result (1 for true, 0 for false) into the corresponding element of *OutputTensor*.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_element_wise_is_infinity_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_IS_INFINITY_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[DML_IS_INFINITY_MODE](/windows/win32/api/directml/ne-directml-dml_is_infinity_mode)**
     * 
     * A [DML_IS_INFINITY_MODE](/windows/win32/api/directml/ne-directml-dml_is_infinity_mode) determining the sign of the infinity to check for.
     * 
     * * If **DML_IS_INFINITY_MODE_EITHER**, then 1 will be returned if the element is -inf or inf, otherwise 0.
     * * If **DML_IS_INFINITY_MODE_POSITIVE**, then 1 will be returned if the element is inf, otherwise 0.
     * * If **DML_IS_INFINITY_MODE_NEGATIVE**`, then 1 will be returned if the element is -inf, otherwise 0.
     * @type {Integer}
     */
    InfinityMode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
