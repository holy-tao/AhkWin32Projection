#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Adds every element in *ATensor* to its corresponding element in *BTensor*, placing the result into the corresponding element of *OutputTensor*. (DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_element_wise_quantized_linear_add_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ELEMENT_WISE_QUANTIZED_LINEAR_ADD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the left-hand-side inputs.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ATensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired scale factor for *ATensor*. The expected number of elements in *AScaleTensor* is 1.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    AScaleTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired zero point for *ATensor*. The expected number of elements in *AZeroPointTensor* is 1. *AZeroPointTensor* is an optional tensor that defaults to 0 if not provided.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    AZeroPointTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the right-hand-side inputs.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired scale factor for *BTensor*. The expected number of elements in *BScaleTensor* is 1.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BScaleTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired zero point for *BTensor*. The expected number of elements in *BZeroPointTensor* is 1. *BZeroPointTensor* is an optional tensor that defaults to 0 if not provided.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BZeroPointTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired scale factor for *OutputTensor*. This is an input tensor defining the output quantization scale factor to use while quantizing the output values. The expected number of elements in *OutputScaleTensor* is 1.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputScaleTensor {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the desired zero point for *OutputTensor*. This is an input tensor defining the output quantization zero point to use while quantizing the output values. The expected number of elements in *OutputZeroPointTensor* is 1. *OutputZeroPointTensor* is an optional tensor that defaults to 0 if not provided.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputZeroPointTensor {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
