#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes backpropagation gradients for [batch normalization training](/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BATCH_NORMALIZATION_TRAINING_GRAD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. This is typically the same tensor that was provided as the *InputTensor* to [**DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC**](/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The incoming gradient tensor. This is typically obtained from the output of backpropagation of a preceding layer.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the mean data. This is typically the same tensor that was returned by *MeanTensor* from [**DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC**](/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    MeanTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the variance data. This is typically the same tensor that was returned as the *OutputVarianceTensor* from [**DML_BATCH_NORMALIZATION_TRAINING_OPERATOR_DESC**](/windows/win32/api/directml/ns-directml-dml_batch_normalization_training_operator_desc) in the forward pass.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    VarianceTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the scale data.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ScaleTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * For every corresponding value in the inputs:  
     * 
     * ```
     * Coef0 = 1.0f / sqrt(Variance + Epsilon)
     * Coef1 = InputGradient * (Input - mean(Input))
     * InputGradientCentered = InputGradient - mean(InputGradient)
     * InputCentered = InputCentered - mean(InputCentered)
     * OutputGradient = Scale * Coef0 * (InputGradientCentered - InputCentered * mean(Coef1) / (Variance + Epsilon))
     * ```
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The following computation is done or every corresponding value in the inputs: `OutputScaleGradient = sum(InputGradient * (Input - Mean) / sqrt(Variance + Epsilon))`
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputScaleGradientTensor {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The following computation is done or every corresponding value in the inputs: `OutputBiasGradient = sum(InputGradient)`
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputBiasGradientTensor {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: [**FLOAT**](/windows/desktop/winprog/windows-data-types)
     * 
     * A small float value added to the variance to avoid zero.
     * @type {Float}
     */
    Epsilon {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }
}
