#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Casts each element in the input to the data type of the output tensor, and stores the result in the corresponding element of the output.
 * @remarks
 * Some data types might not be supported on certain hardware. To determine whether a data type is supported, use [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport) with [DML_FEATURE_TENSOR_DATA_TYPE_SUPPORT](/windows/win32/api/directml/ne-directml-dml_feature).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_cast_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_CAST_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor's *Sizes* should match *InputTensor*.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A pointer to a constant [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc) containing the description of the tensor to write the results to.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

}
