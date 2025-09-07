#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes each element of *InputTensor* raised to the power of the corresponding element of *ExponentTensor*, placing the result into the corresponding element of *OutputTensor*.
 * @remarks
 * Until `DML_FEATURE_LEVEL_3_0`, *ExponentTensor* _must_ match the type of *InputTensor*.
  * 
  * See [DML_ELEMENT_WISE_CONSTANT_POW_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_element_wise_constant_pow_operator_desc) for a POW operator that accepts a `FLOAT` constant for the exponent.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_pow_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_POW_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the input values.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the exponent values.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ExponentTensor {
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
     * Type: \_Maybenull\_ **const [DML_SCALE_BIAS](/windows/win32/api/directml/ns-directml-dml_scale_bias)\***
     * 
     * An optional scale and bias to apply to the input. If present, this has the effect of applying the function `g(x) = x * scale + bias` to each *input* element prior to computing this operator.
     * @type {Pointer<DML_SCALE_BIAS>}
     */
    ScaleBias {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
