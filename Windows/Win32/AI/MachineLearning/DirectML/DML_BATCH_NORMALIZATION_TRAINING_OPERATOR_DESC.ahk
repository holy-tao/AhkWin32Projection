#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_OPERATOR_DESC.ahk" { DML_OPERATOR_DESC }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * The DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC structure (directml.h) performs a batch normalization on the input.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Input data.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Scale data.
     */
    ScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Bias  data.
     */
    BiasTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing data that is added to the result prior to FusedActivation, if any.
     */
    FusedAddTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the results to.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the mean of the input to.
     */
    OutputMeanTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the variance of the input to.
     */
    OutputVarianceTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**FLOAT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The epsilon value to use to avoid division by zero.
     */
    Epsilon : Float32

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the normalization. For more info, see [Using fused operators for improved performance](/windows/ai/directml/dml-fused-activations).
     */
    FusedActivation : DML_OPERATOR_DESC.Ptr

}
