#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes the Lp-normalized value across the elements within the sliding window over the input tensor.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_lp_pooling_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_LP_POOLING_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An input tensor with *Sizes* `{ BatchCount, ChannelCount, Height, Width }` for 4D, and `{ BatchCount, ChannelCount, Depth, Height, Width }` for 5D.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write to. The *Sizes* of the output tensor can be computed as follows.
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
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of spatial dimensions of the input tensor *InputTensor*, which also corresponds to the number of dimensions of the sliding window *WindowSize*. This value also determines the size of the *Strides*, *StartPadding*, and *EndPadding* arrays. It should be set to 2 when *InputTensor* is 4D, and 3 when it's a 5D tensor.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the strides for the sliding window dimensions of sizes `{ Height, Width }` when the *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<Integer>}
     */
    Strides {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the dimensions of the sliding window in `{ Height, Width }`when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<Integer>}
     */
    WindowSize {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the number of padding elements to be applied to the beginning of each spatial dimension of the input tensor *InputTensor*. The values are in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<Integer>}
     */
    StartPadding {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the number of padding elements to be applied to the end of each spatial dimension of the input tensor *InputTensor*. The values are in `{ Height, Width }` when *DimensionCount* is set to 2, or `{ Depth, Height, Width }` when set to 3.
     * @type {Pointer<Integer>}
     */
    EndPadding {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The value of the `P` variable in the Lp-normalization function `Y = (X1^P + X2^P + ... + Xn^P) ^ (1/P)`, where `X1` to `Xn` representing each of the values within the sliding window. In common use cases, this value is either set to 1 or 2, representing either the L1 or L2 normalization respectively.
     * @type {Integer}
     */
    P {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
