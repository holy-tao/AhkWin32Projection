#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_AXIS_DIRECTION.ahk" { DML_AXIS_DIRECTION }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Sums the elements of a tensor along an axis, writing the running tally of the summation into the output tensor.
 * @remarks
 * This operator supports in-place execution, meaning that the *OutputTensor* is permitted to alias the *InputTensor* during binding.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_cumulative_summation_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_CUMULATIVE_SUMMATION_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input tensor containing elements to be summed.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the resulting cumulative summations to. This tensor must have the same sizes and data type as the *InputTensor*.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension to sum elements over. This value must be less than the *DimensionCount* of the *InputTensor*.
     */
    Axis : UInt32

    /**
     * Type: **[DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction)**
     * 
     * One of the values of the [DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction) enumeration. If set to **DML_AXIS_DIRECTION_INCREASING**, then the summation occurs by traversing the tensor along the specified axis by ascending element index. If set to **DML_AXIS_DIRECTION_DECREASING**, the reverse is true, and the summation occurs by traversing elements by descending index.
     */
    AxisDirection : DML_AXIS_DIRECTION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If **TRUE**, then the value of the current element is excluded when writing the running tally to the output tensor. If **FALSE**, then the value of the current element is included in the running tally.
     */
    HasExclusiveSum : BOOL

}
