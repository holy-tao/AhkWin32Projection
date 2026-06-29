#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Splits an input tensor along an axis into multiple output tensors.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_split_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_SPLIT_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to split into multiple output tensors.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *OutputTensors* array. This value must be greater than 0.
     */
    OutputCount : UInt32

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An array containing the descriptions of the tensors split off from the input tensor. The output sizes must have the same sizes as the input tensor except for the split axis.
     */
    OutputTensors : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The index of the dimension of the input tensor to split. All input and output tensors must have identical sizes in all dimensions except for this axis. This value must be in the range `[0, InputTensor.DimensionCount - 1]`.
     */
    Axis : UInt32

}
