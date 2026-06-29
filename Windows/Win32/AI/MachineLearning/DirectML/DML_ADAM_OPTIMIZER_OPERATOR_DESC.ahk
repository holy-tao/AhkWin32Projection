#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Computes updated weights (parameters) using the supplied gradients, based on the Adam (**ADA**ptive **M**oment estimation) algorithm. This operator is an optimizer, and is typically used in the weight update step of a training loop to perform gradient descent.
 * @remarks
 * This operator supports in-place execution, meaning that each output tensor is permitted to alias an eligible input tensor during binding. For example, it's possible to bind the same resource for both the *InputParametersTensor* and *OutputParametersTensor* in order to effectively achieve an in-place update of the input parameters. All of this operator's input tensors, with the exception of the *TrainingStepTensor*, are eligible to be aliased in this way.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_adam_optimizer_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ADAM_OPTIMIZER_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the parameters (weights) to apply this optimizer to. The gradient, first, and second moment estimates, current training step, as well as hyperparameters *LearningRate*, *Beta1*, and *Beta2*, are used by this operator to perform gradient descent on the weight values supplied in this tensor.
     */
    InputParametersTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the first moment estimate of the gradient for each weight value. These values are typically obtained as the result of a previous execution of this operator, via the *OutputFirstMomentTensor*.
     * 
     * When applying this optimizer to a set of weights for the first time (for example, during the initial training step) the values of this tensor should typically be initialized to zero. Subsequent executions should use the values returned in *OutputFirstMomentTensor*.
     * 
     * The *Sizes* and *DataType* of this tensor must exactly match those of the *InputParametersTensor*.
     */
    InputFirstMomentTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the second moment estimate of the gradient for each weight value. These values are typically obtained as the result of a previous execution of this operator, via the *OutputSecondMomentTensor*.
     * 
     * When applying this optimizer to a set of weights for the first time (for example, during the initial training step) the values of this tensor should typically be initialized to zero. Subsequent executions should use the values returned in *OutputSecondMomentTensor*.
     * 
     * The *Sizes* and *DataType* of this tensor must exactly match those of the *InputParametersTensor*.
     */
    InputSecondMomentTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The gradients to apply to the input parameters (weights) for gradient descent. Gradients are typically obtained in a backpropagation pass during training.
     * 
     * The *Sizes* and *DataType* of this tensor must exactly match those of the *InputParametersTensor*.
     */
    GradientTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A scalar tensor containing a single integer value representing the current training step count. This value along with *Beta1* and *Beta2* is used to compute the exponential decay of the first and second moment estimate tensors.
     * 
     * Typically the training step value starts at 0 at the beginning of training, and is incremented by 1 on each successive training step. This operator doesn't update the training step value; you should do that manually, for example using [DML_OPERATOR_ELEMENT_WISE_ADD](/windows/win32/api/directml/ns-directml-dml_element_wise_add_operator_desc).
     * 
     * This tensor must be a scalar (that is, all *Sizes* equal to 1) and have data type [**DML_TENSOR_DATA_TYPE_UINT32**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type).
     */
    TrainingStepTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor that holds the updated parameter (weight) values after gradient descent is applied.
     * 
     * During binding, this tensor is permitted to alias an eligible input tensor, which can be used to perform an in-place update of this tensor. See the [Remarks](#remarks) section for more details.
     * 
     * The *Sizes* and *DataType* of this tensor must exactly match those of the *InputParametersTensor*.
     */
    OutputParametersTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing updated first moment estimates. You should store the values of this tensor, and supply them in *InputFirstMomentTensor* during the subsequent training step.
     * 
     * During binding, this tensor is permitted to alias an eligible input tensor, which can be used to perform an in-place update of this tensor. See the [Remarks](#remarks) section for more details.
     * 
     * The *Sizes* and *DataType* of this tensor must exactly match those of the *InputParametersTensor*.
     */
    OutputFirstMomentTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing updated second moment estimates. You should store the values of this tensor and supply them in *InputSecondMomentTensor* during the subsequent training step.
     * 
     * During binding, this tensor is permitted to alias an eligible input tensor, which can be used to perform an in-place update of this tensor. See the [Remarks](#remarks) section for more details.
     * 
     * The *Sizes* and *DataType* of this tensor must exactly match those of the *InputParametersTensor*.
     */
    OutputSecondMomentTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **float**
     * 
     * The learning rate, also commonly referred to as the *step size*. The learning rate is a hyperparameter that determines the magnitude of the weight update along the gradient vector on each training step.
     */
    LearningRate : Float32

    /**
     * Type: **float**
     * 
     * A hyperparameter representing the exponential decay rate of the gradient's first moment estimate. This value should be between 0.0 and 1.0. A value of 0.9f is typical.
     */
    Beta1 : Float32

    /**
     * Type: **float**
     * 
     * A hyperparameter representing the exponential decay rate of the gradient's second moment estimate. This value should be between 0.0 and 1.0. A value of 0.999f is typical.
     */
    Beta2 : Float32

    /**
     * Type: **float**
     * 
     * A small value used to help numerical stability by preventing division-by-zero. For 32-bit floating-point inputs, typical values include 1e-8 or `FLT_EPSILON`.
     */
    Epsilon : Float32

}
