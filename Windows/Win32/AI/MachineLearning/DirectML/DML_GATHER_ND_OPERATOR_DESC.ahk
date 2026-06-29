#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Gathers elements from the input tensor, using the indices tensor to remap indices to entire subblocks of the input. (DML_GATHER_ND_OPERATOR_DESC)
 * @remarks
 * A newer version of this operator, `DML_OPERATOR_GATHER_ND1`, was introduced in `DML_FEATURE_LEVEL_3_0`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_gather_nd_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_GATHER_ND_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the indices. The *DimensionCount* of this tensor must match *InputTensor.DimensionCount*. The last dimension of the *IndicesTensor* is actually the number of coordinates per index tuple, and it cannot exceed *InputTensor.DimensionCount*. For example, an indices tensor of *Sizes* `{1,4,5,2}` with *IndicesDimensionCount* = 3 means a 4x5 array of 2-coordinate tuples that index into *InputTensor*.
     * 
     * Starting with `DML_FEATURE_LEVEL_3_0`, this operator supports negative index values when using a signed integral type with this tensor. Negative indices are interpreted as being relative to the end of the respective dimension. For example, an index of -1 refers to the last element along that dimension.
     */
    IndicesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The *DimensionCount* and *DataType* of this tensor must match *InputTensor.DimensionCount*. The expected *OutputTensor.Sizes* are the concatenation of the *IndicesTensor.Sizes* leading segments and *InputTensor.Sizes* trailing segment to yield:
     * 
     * ```
     * indexTupleSize = IndicesTensor.Sizes[IndicesTensor.DimensionCount - 1]
     * OutputTensor.Sizes = {
     *     1...,
     *     IndicesTensor.Sizes[(IndicesTensor.DimensionCount - IndicesDimensionCount) .. (IndicesTensor.DimensionCount - 1)],
     *     InputTensor.Sizes[(InputTensor.DimensionCount - indexTupleSize) .. InputTensor.DimensionCount]
     * }
     * ```
     * 
     * The output dimensions are right-aligned, with leading 1 values prepended if needed to satisfy up to *OutputTensor.DimensionCount*.
     * 
     * Here's an example.
     * 
     * ```
     * InputTensor.Sizes = {3,4,5,6,7}
     * InputDimensionCount = 5
     * IndicesTensor.Sizes = {1,1, 1,2,3}
     * IndicesDimensionCount = 3 // can be thought of as a {1,2} array of 3-coordinate tuples
     * 
     * // The {1,2} comes from the indices tensor (ignoring last dimension which is the tuple size),
     * // and the {6,7} comes from input tensor, ignoring the first 3 dimensions
     * // since the index tuples are 3 elements (from the indices tensor last dimension).
     * OutputTensor.Sizes = {1, 1,2,6,7}
     * ```
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of actual input dimensions within the *InputTensor* after ignoring any irrelevant leading ones, ranging `[1, *InputTensor.DimensionCount*]`. For example, given *InputTensor.Sizes* = `{1,1,4,6}` and `InputDimensionCount` = 3, the actual meaningful indices are `{1,4,6}`.
     */
    InputDimensionCount : UInt32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of actual index dimensions within the *IndicesTensor* after ignoring any irrelevant leading ones, ranging [1, *IndicesTensor.DimensionCount*]. For example, given *IndicesTensor.Sizes* = `{1,1,4,6}`, and *IndicesDimensionCount* = 3, the actual meaningful indices are `{1,4,6}`.
     */
    IndicesDimensionCount : UInt32

}
