#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Inverts a max-pooling operation (see [DML_MAX_POOLING_OPERATOR1_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling1_operator_desc) for details) by filling the output tensor *OutputTensor* with the values in the input tensor *InputTensor*, as obtained from a max-pooling operation, according to the index values provided in the *IndicesTensor*. The elements in the output tensor untouched by this process are left with zero values.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_max_unpooling_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_MAX_UNPOOLING_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor of *Sizes* `{ Batch, Channel, Height, Width }`. The tensor values are obtained from the values in the *OutputTensor* of a max-pooling operation.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor of indices to the output tensor *OutputTensor* for the values given in the input tensor *InputTensor*. These index values are zero-based, and treat the output tensor as a contiguous one-dimensional array. Both the *InputTensor* and *IndicesTensor* have the same tensor sizes. The tensor values are obtained from the *OutputIndicesTensor* of a max-pooling operation.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    IndicesTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor of the same number of dimensions as the input tensor.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
