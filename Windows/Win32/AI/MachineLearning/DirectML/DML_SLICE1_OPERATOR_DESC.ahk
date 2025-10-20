#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Extracts a single subregion (a "slice") of an input tensor.
 * @remarks
 * This operator is similar to [DML_SLICE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_slice_operator_desc), but it differs in two important ways.
  * 
  * - Slice strides may be negative, which allows reversing values along dimensions.
  * - The input window sizes are not necessarily the same as the output tensor sizes.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_slice1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SLICE1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to extract slices from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the sliced data results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of dimensions. This field determines the size of the *InputWindowOffsets*, *InputWindowSizes*, and *InputWindowStrides* arrays. This value must match the *DimensionCount* of the input and output tensors. This value must be between 1 and 8, inclusively, starting from `DML_FEATURE_LEVEL_3_0`; earlier feature levels require a value of either 4 or 5.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the beginning (in elements) of the input window in each dimension. Values in the array must satisfy the constraint `InputWindowOffsets[i] + InputWindowSizes[i] <= InputTensor.Sizes[i]`
     * @type {Pointer<Integer>}
     */
    InputWindowOffsets {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the extent (in elements) of the input window in each dimension. Values in the array must satisfy the constraint `InputWindowOffsets[i] + InputWindowSizes[i] <= InputTensor.Sizes[i]`
     * @type {Pointer<Integer>}
     */
    InputWindowSizes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the slice's stride along each dimension of the input tensor, in elements. The magnitude of the stride indicates how many elements to advance when copying within the input window. The sign of the stride determines if elements are copied starting at the beginning of the window (positive stride) or end of the window (negative stride). Strides may not be 0.
     * @type {Pointer<Integer>}
     */
    InputWindowStrides {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
