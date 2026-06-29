#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_AXIS_DIRECTION.ahk" { DML_AXIS_DIRECTION }

/**
 * Outputs the indices of the minimum-valued elements within one or more dimensions of the input tensor.
 * @remarks
 * The output tensor sizes must be the same as the input tensor sizes, except for the reduced axes, which must be 1.
 * 
 * When *AxisDirection* is [DML_AXIS_DIRECTION_INCREASING](/windows/win32/api/directml/ne-directml-dml_axis_direction), this API is equivalent to [DML_REDUCE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_reduce_operator_desc) with [DML_REDUCE_FUNCTION_ARGMIN](/windows/win32/api/directml/ne-directml-dml_reduce_function).
 * 
 * A subset of this functionality is exposed through the [DML_REDUCE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_reduce_operator_desc) operator, and is supported on earlier DirectML feature levels.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_argmin_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ARGMIN_OPERATOR_DESC {
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
     * The tensor to write the results to. Each output element is the result of an *argmin* reduction on a subset of elements from the *InputTensor*.
     * 
     * - *DimensionCount* must match *InputTensor.DimensionCount* (the rank of the input tensor is preserved).
     * - *Sizes* must match *InputTensor.Sizes*, except for dimensions included in the reduced *Axes*, which must be size 1.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The number of axes to reduce. This field determines the size of the *Axes* array.
     */
    AxisCount : UInt32

    /**
     * Type: \_Field_size\_(AxisCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The axes along which to reduce. Values must be in the range `[0, InputTensor.DimensionCount - 1]`.
     */
    Axes : IntPtr

    /**
     * DML_AXIS_DIRECTION AxisDirection;
     * 
     * Type: **[DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction)**
     * 
     * Determines which index to select when multiple input elements have the same value.
     * - **DML_AXIS_DIRECTION_INCREASING** returns the index of the first minimum-valued element (for example, `argmin({1,2,3,2,1}) = 0`)
     * - **DML_AXIS_DIRECTION_DECREASING** returns the index of the last minimum-valued element (for example, `argmin({1,2,3,2,1}) = 4`)
     */
    AxisDirection : DML_AXIS_DIRECTION

}
