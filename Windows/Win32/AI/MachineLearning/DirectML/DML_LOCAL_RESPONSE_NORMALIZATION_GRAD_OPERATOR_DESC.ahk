#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Computes backpropagation gradients for [local response normalization](/windows/win32/api/directml/ns-directml-dml_local_response_normalization_operator_desc).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_local_response_normalization_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_LOCAL_RESPONSE_NORMALIZATION_GRAD_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the input data. This tensor's *Sizes* should be `{ BatchCount, ChannelCount, Height, Width }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer.
     */
    InputGradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients.
     */
    OutputGradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * **TRUE** if the LRN layer sums across channels; **FALSE** if the LRN layer sums across spatial dimensions.
     */
    CrossChannel : BOOL

    /**
     * Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The maximum number of elements to sum over per dimension (the local region is clipped so that all elements are within bounds). If *CrossChannel* is **TRUE**, then this is the width and height of the local region. If *CrossChannel* is **FALSE**, then this is the number of elements in the local region. This value must be at least 1.
     */
    LocalSize : UInt32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the scaling parameter. We recommend a value of 0.0001 as default.
     */
    Alpha : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of the exponent. We recommend a value of 0.75 as default.
     */
    Beta : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The value of bias. We recommend a value of 1 as default.
     */
    Bias : Float32

}
