#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SCALAR_UNION.ahk

/**
 * Performs a clamping (or limiting) operation for each element of *InputTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_clip1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_CLIP1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 144

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
     * Type: \_Maybenull\_ **const [DML_SCALE_BIAS](/windows/win32/api/directml/ns-directml-dml_scale_bias)\***
     * 
     * An optional scale and bias to apply to the input. If present, this has the effect of applying the function `g(x) = x * scale + bias` to each *input* element prior to computing this operator.
     * @type {Pointer<DML_SCALE_BIAS>}
     */
    ScaleBias {
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
     * The minimum value, below which the operator replaces the value with *Min*. *MinMaxDataType* determines how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    Min{
        get {
            if(!this.HasProp("__Min"))
                this.__Min := DML_SCALAR_UNION(32, this)
            return this.__Min
        }
    }

    /**
     * Type: [**DML_SCALAR_UNION**](/windows/win32/api/directml/ns-directml-dml_scalar_union)
     * 
     * The maximum value, above which the operator replaces the value with *Max*. *MinMaxDataType* determines how to interpret the field.
     * @type {DML_SCALAR_UNION}
     */
    Max{
        get {
            if(!this.HasProp("__Max"))
                this.__Max := DML_SCALAR_UNION(88, this)
            return this.__Max
        }
    }
}
