#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Computes the maximum value across the elements within the sliding window over the input tensor, and optionally returns the indices of the maximum values selected. (DML_MAX_POOLING1_OPERATOR_DESC)
 * @remarks
 * When *OutputIndicesTensor* is set to NULL, this operator is equivalent to [DML_MAX_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling_operator_desc).
 * 
 * A newer version of this operator, [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_max_pooling1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_MAX_POOLING1_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor of *Sizes* `{ BatchCount, ChannelCount, Height, Width }` if *InputTensor.DimensionCount* is 4, and `{ BatchCount, ChannelCount, Depth, Height, Weight } `if *InputTensor.DimensionCount* is 5.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor to write the results to. The sizes of the output tensor can be computed as follows.
     * 
     * ```cpp
     * OutputTensor->Sizes[0] = InputTensor->Sizes[0];
     * OutputTensor->Sizes[1] = InputTensor->Sizes[1];
     * 
     * for (UINT i = 0; i < DimensionCount; ++i) {
     *   UINT PaddedSize = InputTensor->Sizes[i + 2] + StartPadding[i] + EndPadding[i];
     *   OutputTensor->Sizes[i + 2] = (PaddedSize - WindowSizes[i]) / Strides[i] + 1;
     * }
     * ```
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional output tensor of indices to the input tensor *InputTensor* of the maximum values produced and stored in the *OutputTensor*. These index values are zero-based and treat the input tensor as a contiguous one-dimensional array. When multiple elements within the sliding window have the same value, the later equal values are ignored and the index points to the first value encountered. Both the *OutputTensor* and *OutputIndicesTensor* have the same tensor sizes.
     */
    OutputIndicesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of spatial dimensions of the input tensor *InputTensor*, which also corresponds to the number of dimensions of the sliding window *WindowSize*. This value also determines the size of the *Strides*, *StartPadding*, and *EndPadding* arrays. It should be set to 2 when *InputTensor* is 4D, and 3 when it's a 5D tensor.
     */
    DimensionCount : UInt32

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The strides for the sliding window dimensions of sizes `{ Height, Width }` when the *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     */
    Strides : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The dimensions of the sliding window in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     */
    WindowSize : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The number of padding elements to be applied to the beginning of each spatial dimension of the input tensor *InputTensor*. The values are in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     */
    StartPadding : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The number of padding elements to be applied to the end of each spatial dimension of the input tensor *InputTensor*. The values are in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     */
    EndPadding : IntPtr

}
