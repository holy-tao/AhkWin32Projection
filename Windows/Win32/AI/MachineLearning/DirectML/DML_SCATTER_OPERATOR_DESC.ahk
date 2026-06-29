#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Copies the whole input tensor to the output, then overwrites selected indices with corresponding values from the updates tensor. (DML_SCATTER_OPERATOR_DESC)
 * @remarks
 * **DML_SCATTER_OPERATOR_DESC** has been more properly aliased to the name **DML_SCATTER_ELEMENTS_OPERATOR_DESC** as the proper counterpart to [DML_GATHER_ELEMENTS_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_elements_operator_desc). This is because **DML_SCATTER_OPERATOR_DESC** was not really symmetric to [DML_GATHER_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_gather_operator_desc).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_scatter_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_SCATTER_OPERATOR_DESC {
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
     * A tensor containing the indices into the output tensor. The *Sizes* must match *InputTensor.Sizes* for every dimension except *Axis*.
     * 
     * Starting with `DML_FEATURE_LEVEL_3_0`, this operator supports negative index values when using a signed integral type with this tensor. Negative indices are interpreted as being relative to the end of the axis dimension. For example, an index of -1 refers to the last element along that dimension.
     */
    IndicesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the new values to replace the existing input values at the corresponding indices. The *Sizes* of this tensor must match *IndicesTensor.Sizes*. The *DataType* must match *InputTensor.DataType*.
     */
    UpdatesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The *Sizes* and *DataType* of this tensor must match *InputTensor*.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The axis dimension to use for indexing in *OutputTensor*, ranging `[0, OutputTensor.DimensionCount)`.
     */
    Axis : UInt32

}
