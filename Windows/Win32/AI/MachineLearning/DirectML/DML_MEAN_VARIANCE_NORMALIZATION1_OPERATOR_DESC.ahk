#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a mean variance normalization function on the input tensor. This operator will calculate the mean and variance of the input tensor to perform normalization.
 * @remarks
 * **DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC** is a superset of functionality of [DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_mean_variance_normalization_operator_desc). Here, setting the **Axes** array to `{ 0, 2, 3 }` is the equivalent of setting *CrossChannel* to **FALSE** in **DML_MEAN_VARIANCE_NORMALIZATION_OPERATOR_DESC**; while setting the **Axes** array to `{ 1, 2, 3 }` is equivalent of setting *CrossChannel* to **TRUE**.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_mean_variance_normalization1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_MEAN_VARIANCE_NORMALIZATION1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 64

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
     * An optional tensor containing the Scale data.
     * 
     * If **DML_FEATURE_LEVEL** is less than **DML_FEATURE_LEVEL_4_0**, then this tensor's dimensions should be `{ ScaleBatchCount, ChannelCount, ScaleHeight, ScaleWidth }`. The dimensions ScaleBatchCount, ScaleHeight, and ScaleWidth should either match *InputTensor*, or be set to 1 to automatically broadcast those dimensions across the input.
     * 
     * If **DML_FEATURE_LEVEL** is greater than or equal to **DML_FEATURE_LEVEL_4_0**, then any dimension can be set to 1, and be automatically broadcast to match *InputTensor*.
     * 
     * This tensor is required if the *BiasTensor* is used.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ScaleTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the Bias data.
     * 
     * If **DML_FEATURE_LEVEL** is less than **DML_FEATURE_LEVEL_4_0**, then this tensor's dimensions should be `{ BiasBatchCount, ChannelCount, BiasHeight, BiasWidth }`. The dimensions BiasBatchCount, BiasHeight, and BiasWidth should either match *InputTensor*, or be set to 1 to automatically broadcast those dimensions across the input.
     * 
     * If **DML_FEATURE_LEVEL** is greater than or equal to **DML_FEATURE_LEVEL_4_0**, then any dimension can be set to 1, and be automatically broadcast to match *InputTensor*.
     * 
     * This tensor is required if the *ScaleTensor* is used.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of axes. This field determines the size of the *Axes* array.
     * @type {Integer}
     */
    AxisCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(AxisCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\*** 
     * 
     * The axes along which to calculate the Mean and Variance.
     * @type {Pointer<UInt32>}
     */
    Axes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the Normalization layer includes Variance in the normalization calculation. Otherwise, **FALSE**. If **FALSE**, then normalization equation is `Output = FusedActivation(Scale * (Input - Mean) + Bias)`.
     * @type {Integer}
     */
    NormalizeVariance {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The epsilon value to use to avoid division by zero. A value of 0.00001 is recommended as default.
     * @type {Float}
     */
    Epsilon {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the normalization.
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    FusedActivation {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
