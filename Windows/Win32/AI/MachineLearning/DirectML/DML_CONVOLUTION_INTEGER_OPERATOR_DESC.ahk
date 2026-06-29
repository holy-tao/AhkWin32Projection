#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_CONVOLUTION_INTEGER_OPERATOR_DESC {
    #StructPack 8

    InputTensor : DML_TENSOR_DESC.Ptr

    InputZeroPointTensor : DML_TENSOR_DESC.Ptr

    FilterTensor : DML_TENSOR_DESC.Ptr

    FilterZeroPointTensor : DML_TENSOR_DESC.Ptr

    OutputTensor : DML_TENSOR_DESC.Ptr

    DimensionCount : UInt32

    Strides : IntPtr

    Dilations : IntPtr

    StartPadding : IntPtr

    EndPadding : IntPtr

    GroupCount : UInt32

}
