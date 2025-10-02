#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * Computes backpropagation gradients for [element-wise clip](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip_grad1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_CLIP_GRAD1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input feature tensor. This is typically the same tensor that was provided as the *InputTensor* to [DML_OPERATOR_ELEMENT_WISE_CLIP1](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer. Typically this tensor would have the same sizes as the *output* of the corresponding [DML_OPERATOR_ELEMENT_WISE_CLIP1](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients. Typically this tensor would have the same sizes as the *input* of the corresponding [DML_OPERATOR_ELEMENT_WISE_CLIP1](/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type of the *Min* and *Max* members, which must match *OutputTensor.DataType*.
     * @type {Integer}
     */
    MinMaxDataType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The minimum value. If x is at or below this value, then the gradient result is 0. *MinMaxDataType* determines how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    Min{
        get {
            if(!this.HasProp("__Min"))
                this.__Min := DML_SCALAR_UNION(this.ptr + 32)
            return this.__Min
        }
    }

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The maximum value. If x is at or above this value, then the gradient result is 0. *MinMaxDataType* determines how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    Max{
        get {
            if(!this.HasProp("__Max"))
                this.__Max := DML_SCALAR_UNION(this.ptr + 88)
            return this.__Max
        }
    }
}
