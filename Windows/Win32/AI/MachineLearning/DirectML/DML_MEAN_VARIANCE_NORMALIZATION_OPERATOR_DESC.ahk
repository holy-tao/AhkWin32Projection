#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a mean variance normalization function on the input tensor. This operator will calculate the mean and variance of the input tensor to perform normalization. (DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC)
 * @remarks
 * A newer version of this operator, [DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization1_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Input data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the Scale data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`. Any dimension can be replaced with 1 to broadcast in that dimension. If **DML_FEATURE_LEVEL** is less than **DML_FEATURE_LEVEL_5_2**, then this tensor is required if *BiasTensor* is present. If **DML_FEATURE_LEVEL** is greater than or equal to **DML_FEATURE_LEVEL_5_2**, then this tensor can be null regardless of the value of *BiasTensor*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ScaleTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the bias data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`. Any dimension can be replaced with 1 to broadcast in that dimension. If **DML_FEATURE_LEVEL** is less than **DML_FEATURE_LEVEL_5_2**, then this tensor is required if *ScaleTensor* is present. If **DML_FEATURE_LEVEL** is greater than or equal to **DML_FEATURE_LEVEL_5_2**, then this tensor can be null regardless of the value of *ScaleTensor*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BiasTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the results to. This tensor's dimensions are `{ BatchCount, ChannelCount, Height, Width }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the MeanVariance layer includes channels in the Mean and Variance calculations. Otherwise, **FALSE**.
     * @type {Integer}
     */
    CrossChannel {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the Normalization layer includes Variance in the normalization calculation. Otherwise, **FALSE**. If **FALSE**, then normalization equation is `Output = FusedActivation(Scale * (Input - Mean) + Bias)`.
     * @type {Integer}
     */
    NormalizeVariance {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The epsilon value to use to avoid division by zero. A value of 0.00001 is recommended as default.
     * @type {Float}
     */
    Epsilon {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the normalization. For more info, see [Using fused operators for improved performance](/windows/ai/directml/dml-fused-activations).
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    FusedActivation {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
