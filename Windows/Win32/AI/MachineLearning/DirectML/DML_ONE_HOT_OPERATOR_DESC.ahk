#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Produces a tensor filled with *one-hot encoded* values. This operator produces an output tensor where, for all sequences in a chosen axis, all but one element in that sequence is set to *OffValue*, and the remaining single element is set to *OnValue*.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_one_hot_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ONE_HOT_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the index in elements of the *OnValue*, for each sequence along the *Axis*. Indices are measured relative to the beginning of their sequence (as opposed to the beginning of the tensor). For example, an index of 0 always refers to the first element for all sequences in an axis.
     * 
     * If an index value for a sequence exceeds the number of elements along the *Axis* dimension in the *OutputTensor*, then that index value is ignored, and all elements in that sequence will be set to *OffValue*.
     * 
     * Starting with `DML_FEATURE_LEVEL_3_0`, this operator supports negative index values when using a signed integral type with this tensor. Negative indices are interpreted as being relative to the end of the sequence. For example, an index of -1 refers to the last element in the sequence.
     * 
     * This tensor must have dimension count and sizes equal to the *OutputTensor*, *except* for the dimension specified by the *Axis* parameter. The size of the *Axis* dimension must be 1. For example if the *OutputTensor* has sizes of `{2,3,4,5}` and *Axis* is 1, the sizes of the *IndicesTensor* must be `{2,1,4,5}`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    IndicesTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * This tensor may have any size, so long as it contains at least two elements. The 0th element of this tensor is interpreted as the *OffValue*, and the 1st element along the fastest-changing dimension of size >1 is interpreted as the *OnValue*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ValuesTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the results to. This tensor must have dimension count and sizes equal to the *IndicesTensor*, *except* for the dimension specified by the *Axis* parameter. The size of the *Axis* dimension in this tensor may have any value greater than 0.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension to produce one-hot encoded sequences along. This value must be less than the DimensionCount of the *IndicesTensor*.
     * @type {Integer}
     */
    Axis {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
