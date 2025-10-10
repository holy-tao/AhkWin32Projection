#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs an ROI Align operation, as described in the [Mask R-CNN paper](https://arxiv.org/abs/1703.06870). In summary, the operation extracts crops from the input image tensor and resizes them to a common output size specified by the last 2 dimensions of *OutputTensor* using the specified *InterpolationMode*.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_roi_align_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ROI_ALIGN_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data with dimensions `{ BatchCount, ChannelCount, InputHeight, InputWidth }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the regions of interest (ROI) data. The allowed dimensions of `ROITensor` are `{ NumROIs, 4 }`, `{ 1, NumROIs, 4 }`, or `{ 1, 1, NumROIs, 4 }`. For each ROI, the values will be the coordinates of its top-left and bottom-right corners in the order `[x1, y1, x2, y2]`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ROITensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the batch indices to extract the ROIs from. The allowed dimensions of `BatchIndicesTensor` are `{ NumROIs }`, `{ 1, NumROIs }`, `{ 1, 1, NumROIs }`, or `{ 1, 1, 1, NumROIs }`. Each value is the index of a batch from *InputTensor*. The behavior is undefined if the values are not in the range [0, BatchCount).
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BatchIndicesTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output data. The expected dimensions of *OutputTensor* are `{ NumROIs, ChannelCount, OutputHeight, OutputWidth }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **[DML_REDUCE_FUNCTION](/windows/win32/api/directml/ne-directml-dml_reduce_function)**
     * 
     * The reduction function to use when reducing across all input samples that contribute to an output element ([DML_REDUCE_FUNCTION_AVERAGE](/windows/win32/api/directml/ne-directml-dml_reduce_function) or **DML_REDUCE_FUNCTION_MAX**). The number of input samples to reduce across is bounded by *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     * @type {Integer}
     */
    ReductionFunction {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: **[DML_INTERPOLATION_MODE](/windows/win32/api/directml/ne-directml-dml_interpolation_mode)**
     * 
     * The interpolation mode to use when resizing the regions.
     * 
     * - [DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR](/windows/win32/api/directml/ne-directml-dml_interpolation_mode). Uses the *Nearest Neighbor* algorithm, which chooses the input element nearest to the corresponding pixel center for each output element.
     * - **DML_INTERPOLATION_MODE_LINEAR**. Uses the *Bilinear* algorithm, which computes the output element by doing the weighted average of the 2 nearest neighboring input elements per dimension. Since only 2 dimensions are resized, the weighted average is computed on a total of 4 input elements for each output element.
     * @type {Integer}
     */
    InterpolationMode {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The X (or width) component of the scaling factor to multiply the *ROITensor* coordinates by in order to make them proportionate to *InputHeight* and *InputWidth*. For example, if *ROITensor* contains normalized coordinates (values in the range [0..1]), then *SpatialScaleX* would usually have the same value as *InputWidth*.
     * @type {Float}
     */
    SpatialScaleX {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The Y (or height) component of the scaling factor to multiply the *ROITensor* coordinates by in order to make them proportionate to *InputHeight* and *InputWidth*. For example, if *ROITensor* contains normalized coordinates (values in the range [0..1]), *SpatialScaleY* would usually have the same value as *InputHeight*.
     * @type {Float}
     */
    SpatialScaleY {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value to read from *InputTensor* when the ROIs are outside the bounds of *InputTensor*. This can happen when the values obtained after scaling *ROITensor* by *SpatialScaleX* and *SpatialScaleY* are bigger than *InputWidth* and *InputHeight*.
     * @type {Float}
     */
    OutOfBoundsInputValue {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The minimum number of input samples to use for every output element. The operator will calculate the number of input samples by doing `ScaledCropSize / OutputSize`, and then clamp it to *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     * @type {Integer}
     */
    MinimumSamplesPerOutput {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The maximum number of input samples to use for every output element. The operator will calculate the number of input samples by doing `ScaledCropSize / OutputSize`, and then clamp it to *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     * @type {Integer}
     */
    MaximumSamplesPerOutput {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
