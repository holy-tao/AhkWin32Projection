#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Copies the whole input tensor to the output, then overwrites selected indices with corresponding values from the updates tensor. (DML_SCATTER_ND_OPERATOR_DESC)
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_scatter_nd_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SCATTER_ND_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the indices. The *DimensionCount* of this tensor must match *InputTensor.DimensionCount*. The last dimension of the *IndicesTensor* is actually the number of coordinates per index tuple, and it mustn't exceed *InputTensor.DimensionCount*. For example, an indices tensor of size `{1,4,5,2}` with *IndicesDimensionCount* = 3 means a 4x5 array of 2-value coordinate tuples that index into *InputTensor*.
     * 
     * Starting with `DML_FEATURE_LEVEL_3_0`, this operator supports negative index values when using a signed integral type with this tensor. Negative indices are interpreted as being relative to the end of the respective dimension. For example, an index of -1 refers to the last element along that dimension.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    IndicesTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the new values to replace the existing input values at the corresponding indices. The *DimensionCount* of this tensor must match *InputTensor.DimensionCount*. The expected *UpdatesTensor.Sizes* are the concatenation of the *IndicesTensor.Sizes* leading segments and *InputTensor.Sizes* trailing segment to yield the following.
     * 
     * ```
     * indexTupleSize = IndicesTensor.Sizes[IndicesTensor.DimensionCount - 1]
     * UpdatesTensor.Sizes = [
     *     1...,
     *     IndicesTensor.Sizes[(IndicesTensor.DimensionCount - IndicesDimensionCount) .. (IndicesTensor.DimensionCount - 1)],
     *     InputTensor.Sizes[(InputTensor.DimensionCount - indexTupleSize) .. InputTensor.DimensionCount]
     * ]
     * ```
     * 
     * The dimensions are right-aligned, with leading 1 values prepended if needed to satisfy *UpdatesTensor.DimensionCount*.
     * 
     * Here's an example.
     * 
     * ```
     * InputTensor.Sizes = [3,4,5,6,7]
     * InputDimensionCount = 5
     * IndicesTensor.Sizes = [1,1, 1,2,3]
     * IndicesDimensionCount = 3 // can be thought of as a [1,2] array of 3-coordinate tuples
     * 
     * // The [1,2] comes from the indices tensor (ignoring last dimension, which is the tuple size),
     * // and the [6,7] comes from input tensor, ignoring the first 3 dimensions
     * // since the index tuples are 3 elements (from the indices tensor last dimension).
     * UpdatesTensor.Sizes = [1, 1,2,6,7]
     * ```
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    UpdatesTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The *Sizes* and *DataType* of this tensor must match *InputTensor.Sizes*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of actual input dimensions within the *InputTensor* after ignoring any irrelevant leading ones, ranging [1, *InputTensor.DimensionCount*). For example, given *InputTensor.Sizes* = {1,1,4,6} and *InputDimensionCount* = 3, the actual meaningful indices are {1,4,6}.
     * @type {Integer}
     */
    InputDimensionCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of actual index dimensions within the *IndicesTensor* after ignoring any irrelevant leading ones, ranging [1, *IndicesTensor.DimensionCount*). For example, given *IndicesTensor.Sizes* = {1,1,4,6} and *IndicesDimensionCount* = 3, the actual meaningful indices are {1,4,6}.
     * @type {Integer}
     */
    IndicesDimensionCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
