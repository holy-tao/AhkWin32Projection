#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Gathers elements from the input tensor along **Axis**, using **IndicesTensor** to remap indices.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_gather_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_GATHER_OPERATOR_DESC {
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
     * A tensor containing the indices. The *DimensionCount* of this tensor must match *InputTensor.DimensionCount*.
     * 
     * Starting with `DML_FEATURE_LEVEL_3_0`, this operator supports negative index values when using a signed integral type with this tensor. Negative indices are interpreted as being relative to the end of the axis dimension. For example, an index of -1 refers to the last element along that dimension.
     */
    IndicesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The *DimensionCount* and *DataType* of this tensor must match *InputTensor.DimensionCount*. The expected *OutputTensor.Sizes* are the concatenation of the *InputTensor.Sizes* leading and trailing segments split at the current *Axis* with the *IndicesTensor.Sizes* inserted between.
     * 
     * ```
     * OutputTensor.Sizes = {
     *     InputTensor.Sizes[0..Axis],
     *     IndicesTensor.Sizes[(IndicesTensor.DimensionCount - IndexDimensions) .. IndicesTensor.DimensionCount],
     *     InputTensor.Sizes[(Axis+1) .. InputTensor.DimensionCount]
     * }
     * ```
     * 
     * The dimensions are right-aligned such that any leading 1 values from the input sizes are cropped which would otherwise overflow the output *DimensionCount*.
     * 
     * The number of relevant dimensions in this tensor depends on *IndexDimensions* and the *original rank* of *InputTensor*. The original rank is the number of dimensions prior to any padding with leading ones. The number of relevant dimensions in the output can be computed by the *original rank* of *InputTensor* + *IndexDimensions* - 1. This value must be less than or equal to the *DimensionCount* of *OutputTensor*.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The axis dimension of *InputTensor* to gather on, ranging `[0, *InputTensor.DimensionCount*)`.
     */
    Axis : UInt32

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of actual index dimensions within the `IndicesTensor` after ignoring any irrelevant leading ones, ranging [0, `IndicesTensor.DimensionCount`). For example, given `IndicesTensor.Sizes` = `{ 1, 1, 4, 6 }` and `IndexDimensions` = 3, the actual meaningful indices are `{ 1, 4, 6 }`.
     */
    IndexDimensions : UInt32

}
