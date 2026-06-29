#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_REDUCE_FUNCTION.ahk" { DML_REDUCE_FUNCTION }

/**
 * Outputs the reduction of elements (sum, product, minimum, and so on) within one or more dimensions of the input tensor.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_reduce_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_REDUCE_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: [**DML_REDUCE_FUNCTION**](/windows/win32/api/directml/ne-directml-dml_reduce_function)
     * 
     * Specifies the reduction function to apply to the input.
     */
    Function : DML_REDUCE_FUNCTION

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. Each output element is the result of a reduction on a subset of elements from the *InputTensor*.
     * 
     * - *DimensionCount* must match *InputTensor.DimensionCount* (the rank of the input tensor is preserved).
     * - *Sizes* must match *InputTensor.Sizes*, except for dimensions included in the reduced *Axes*, which must be size 1.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of axes to reduce. This field determines the size of the *Axes* array.
     */
    AxisCount : UInt32

    /**
     * Type: \_Field\_size\_(AxisCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The axes along which to reduce. Values must be in the range `[0, InputTensor.DimensionCount - 1]`.
     */
    Axes : IntPtr

}
