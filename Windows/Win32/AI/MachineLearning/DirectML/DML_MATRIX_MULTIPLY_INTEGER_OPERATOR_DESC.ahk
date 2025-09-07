#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a matrix multiplication function on integer data.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_matrix_multiply_integer_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_MATRIX_MULTIPLY_INTEGER_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the A data. This tensor's dimensions should be `{ BatchCount, ChannelCount, M, K }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ATensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the ATensor zero point data. The expected dimensions of the `AZeroPointTensor` are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, 1, M, 1 }` if per-row quantization is required. These zero point values are used for dequantizing the *ATensor* values.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    AZeroPointTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the B data. This tensor's dimensions should be `{ BatchCount, ChannelCount, K, N }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the *BTensor* zero point data. The expected dimensions of the `BZeroPointTensor` are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, 1, 1, N }` if per column quantization is required. These zero point values are used for dequantizing the BTensor values.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BZeroPointTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor with which to write the results to. This tensor's dimensions are `{ BatchCount, ChannelCount, M, N }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
