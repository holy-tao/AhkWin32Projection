#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_OPERATOR_DESC.ahk" { DML_OPERATOR_DESC }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Performs a mean variance normalization function on the input tensor. This operator will calculate the mean and variance of the input tensor to perform normalization. (DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC)
 * @remarks
 * A newer version of this operator, [DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization1_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the Input data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the Scale data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`. Any dimension can be replaced with 1 to broadcast in that dimension. If **DML_FEATURE_LEVEL** is less than **DML_FEATURE_LEVEL_5_2**, then this tensor is required if *BiasTensor* is present. If **DML_FEATURE_LEVEL** is greater than or equal to **DML_FEATURE_LEVEL_5_2**, then this tensor can be null regardless of the value of *BiasTensor*.
     */
    ScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the bias data. This tensor's dimensions should be `{ BatchCount, ChannelCount, Height, Width }`. Any dimension can be replaced with 1 to broadcast in that dimension. If **DML_FEATURE_LEVEL** is less than **DML_FEATURE_LEVEL_5_2**, then this tensor is required if *ScaleTensor* is present. If **DML_FEATURE_LEVEL** is greater than or equal to **DML_FEATURE_LEVEL_5_2**, then this tensor can be null regardless of the value of *ScaleTensor*.
     */
    BiasTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the results to. This tensor's dimensions are `{ BatchCount, ChannelCount, Height, Width }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the MeanVariance layer includes channels in the Mean and Variance calculations. Otherwise, **FALSE**.
     */
    CrossChannel : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the Normalization layer includes Variance in the normalization calculation. Otherwise, **FALSE**. If **FALSE**, then normalization equation is `Output = FusedActivation(Scale * (Input - Mean) + Bias)`.
     */
    NormalizeVariance : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The epsilon value to use to avoid division by zero. A value of 0.00001 is recommended as default.
     */
    Epsilon : Float32

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the normalization. For more info, see [Using fused operators for improved performance](/windows/ai/directml/dml-fused-activations).
     */
    FusedActivation : DML_OPERATOR_DESC.Ptr

}
