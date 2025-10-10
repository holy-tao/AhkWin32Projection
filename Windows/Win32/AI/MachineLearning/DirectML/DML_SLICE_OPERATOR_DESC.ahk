#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Extracts a single subregion (a "slice") of an input tensor.
 * @remarks
 * A newer version of this operator, [DML_SLICE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_slice1_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_slice_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SLICE_OPERATOR_DESC extends Win32Struct
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
     * The number of dimensions. This field determines the size of the *Offsets*, *Sizes*, and *Strides* arrays. This value must match the *DimensionCount* of the input and output tensors. This value must be between 1 and 8, inclusively, starting from `DML_FEATURE_LEVEL_3_0`; earlier feature levels require a value of either 4 or 5.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the slice's start along each dimension of the input tensor, in elements.
     * @type {Pointer<UInt32>}
     */
    Offsets {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the slice's size along each dimension, in elements. The values in this array must match the sizes specified in the output tensor.
     * @type {Pointer<UInt32>}
     */
    Sizes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * An array containing the slice's stride along each dimension of the input tensor, in elements. A stride larger than 1 indicates that elements of the input tensor may be skipped (for example, a stride of 2 will select every second element along the dimension).
     * @type {Pointer<UInt32>}
     */
    Strides {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
