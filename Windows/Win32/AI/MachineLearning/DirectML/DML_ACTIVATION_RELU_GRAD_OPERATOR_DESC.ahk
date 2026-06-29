#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Computes backpropagation gradients for a rectified linear unit (ReLU).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_activation_relu_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ACTIVATION_RELU_GRAD_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The input (feature) tensor. This is typically the same input as was provided during the forward pass (see [DML_ACTIVATION_RELU_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_activation_relu_operator_desc)).
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer. The *Sizes* and *DataType* of this tensor must exactly match those of the *InputTensor*.
     */
    InputGradientTensor : DML_TENSOR_DESC.Ptr

    OutputGradientTensor : DML_TENSOR_DESC.Ptr

}
