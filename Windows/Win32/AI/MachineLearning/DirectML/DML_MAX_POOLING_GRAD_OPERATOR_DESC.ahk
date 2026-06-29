#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Computes backpropagation gradients for max pooling (see [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc)).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_max_pooling_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_MAX_POOLING_GRAD_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input feature tensor. This is typically the same tensor that was provided as the *InputTensor* to [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) in the forward pass.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer. Typically this tensor would have the same sizes as the *output* of the corresponding [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) in the forward pass.
     */
    InputGradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients. Typically this tensor would have the same sizes as the *input* of the corresponding [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc) in the forward pass.
     */
    OutputGradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of elements in the *Strides*, *WindowSize*, *StartPadding*, *EndPadding*, and *Dilations* arrays. This value must equal the spatial dimension count (InputTensor's DimensionCount - 2). As this operator only supports 4D tensors, the only valid value for this parameter is 2.
     */
    DimensionCount : UInt32

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *Strides* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     */
    Strides : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *WindowSize* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     */
    WindowSize : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *StartPadding* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     */
    StartPadding : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *EndPadding* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     */
    EndPadding : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * See *Dilations* in [DML_MAX_POOLING2_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_max_pooling2_operator_desc).
     */
    Dilations : IntPtr

}
