#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes the maximum value across the elements within the sliding window over the input tensor, and optionally returns the indices of the maximum values selected.
 * @remarks
 * When *OutputIndicesTensor* is set to NULL, this operator is equivalent to [DML_MAX_POOLING_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling_operator_desc).
  * 
  * A newer version of this operator, [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_max_pooling1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_MAX_POOLING1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor of *Sizes* `{ BatchCount, ChannelCount, Height, Width }` if *InputTensor.DimensionCount* is 4, and `{ BatchCount, ChannelCount, Depth, Height, Weight } `if *InputTensor.DimensionCount* is 5.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

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
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional output tensor of indices to the input tensor *InputTensor* of the maximum values produced and stored in the *OutputTensor*. These index values are zero-based and treat the input tensor as a contiguous one-dimensional array. When multiple elements within the sliding window have the same value, the later equal values are ignored and the index points to the first value encountered. Both the *OutputTensor* and *OutputIndicesTensor* have the same tensor sizes.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputIndicesTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of spatial dimensions of the input tensor *InputTensor*, which also corresponds to the number of dimensions of the sliding window *WindowSize*. This value also determines the size of the *Strides*, *StartPadding*, and *EndPadding* arrays. It should be set to 2 when *InputTensor* is 4D, and 3 when it's a 5D tensor.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The strides for the sliding window dimensions of sizes `{ Height, Width }` when the *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<UInt32>}
     */
    Strides {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The dimensions of the sliding window in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<UInt32>}
     */
    WindowSize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The number of padding elements to be applied to the beginning of each spatial dimension of the input tensor *InputTensor*. The values are in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<UInt32>}
     */
    StartPadding {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The number of padding elements to be applied to the end of each spatial dimension of the input tensor *InputTensor*. The values are in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<UInt32>}
     */
    EndPadding {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
