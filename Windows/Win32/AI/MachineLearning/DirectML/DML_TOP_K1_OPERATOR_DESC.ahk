#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Selects the largest or smallest *K* elements from each sequence along an axis of the *InputTensor*, and returns the values and indices of those elements in the *OutputValueTensor* and *OutputIndexTensor*, respectively.
 * @remarks
 * 
 * When *AxisDirection* is set to [DML_AXIS_DIRECTION_DECREASING](/windows/win32/api/directml/ne-directml-dml_axis_direction), this operator is equivalent to [DML_TOP_K_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_top_k_operator_desc).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_top_k1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_TOP_K1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor containing elements to select.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the values of the top *K* elements to. The top *K* elements are selected based on whether they are the largest or the smallest, depending on the value of *AxisDirection*. This tensor must have sizes equal to the *InputTensor*, *except* for the dimension specified by the *Axis* parameter, which must have a size equal to *K*.
     * 
     * The *K* values selected from each input sequence are guaranteed to be sorted descending (largest to smallest) if *AxisDirection* is [DML_AXIS_DIRECTION_DECREASING](/windows/win32/api/directml/ne-directml-dml_axis_direction). Otherwise, the opposite is true and the values selected are guaranteed to be sorted ascending (smallest to largest).
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputValueTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the indices of the top *K* elements to. This tensor must have sizes equal to the *InputTensor*, *except* for the dimension specified by the *Axis* parameter, which must have a size equal to *K*.
     * 
     * The indices returned in this tensor are measured relative to the beginning of their sequence (as opposed to the beginning of the tensor). For example, an index of 0 always refers to the first element for all sequences in an axis.
     * 
     * In cases where two or more elements in the top-K have the same value (that is, when there is a tie), the indices of both elements are included, and are guaranteed to be ordered by ascending element index. Note that this is true irrespective of the value of *AxisDirection*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputIndexTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension to select elements across. This value must be less than the *DimensionCount* of the *InputTensor*.
     * @type {Integer}
     */
    Axis {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of elements to select. *K* must be greater than 0, but less than the number of elements in the *InputTensor* along the dimension specified by *Axis*.
     * @type {Integer}
     */
    K {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: **[DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction)**
     * 
     * A value from the [DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction) enumeration. If set to **DML_AXIS_DIRECTION_INCREASING**, then this operator returns the *smallest* *K* elements in order of increasing value. Otherwise, it returns the *largest* *K* elements in decreasing order.
     * @type {Integer}
     */
    AxisDirection {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
