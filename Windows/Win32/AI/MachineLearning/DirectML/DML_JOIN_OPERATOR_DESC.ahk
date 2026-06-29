#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Concatenates an array of input tensors along a specified axis.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_join_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_JOIN_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *InputTensors* array. This value must be greater than 0.
     */
    InputCount : UInt32

    /**
     * Type: \_Field\_size\_(InputCount) **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An array containing the descriptions of the tensors to join into a single output tensor. All input tensors in this array must have the same sizes except for the join axis, which may have any non-zero value.
     */
    InputTensors : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the joined input tensors into. The output sizes must have the same sizes as all input tensors except for the join axis, which must be equal to the sum of all inputs' join axis size.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension of the input tensors to join. All input and output tensors must have identical sizes in all dimensions except for this axis. This value must be in the range `[0, OutputTensor.DimensionCount - 1]`.
     */
    Axis : UInt32

}
