#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_AXIS_DIRECTION.ahk" { DML_AXIS_DIRECTION }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Multiplies the elements of a tensor along an axis, writing the running tally of the product into the output tensor.
 * @remarks
 * This operator supports in-place execution, meaning that the output tensor is permitted to alias *InputTensor* during binding.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_cumulative_product_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_CUMULATIVE_PRODUCT_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. This is typically the same tensor that was provided as the *InputTensor* to [**DML_BATCH_NORMALIZATION_OPERATOR_DESC**](/windows/win32/api/directml/ns-directml-dml_batch_normalization_operator_desc) in the forward pass.
     * 
     * The input tensor containing elements to be multiplied.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The output tensor to write the resulting cumulative products to. This tensor must have the same sizes and data type as *InputTensor*.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension to multiply elements over. This value must be less than the *DimensionCount* of the *InputTensor*.
     */
    Axis : UInt32

    /**
     * Type: **[DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction)**
     * 
     * One of the values of the [DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction) enumeration. If set to **DML_AXIS_DIRECTION_INCREASING**, then the product occurs by traversing the tensor along the specified axis by ascending element index. If set to **DML_AXIS_DIRECTION_DECREASING**, the reverse is true and the product occurs by traversing elements by descending index.
     */
    AxisDirection : DML_AXIS_DIRECTION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/winprog/windows-data-types">BOOL</a></b>
     * 
     * If **TRUE**, then the value of the current element is excluded when writing the running tally to the output tensor. If **FALSE**, then the value of the current element is included in the running tally.
     */
    HasExclusiveProduct : BOOL

}
