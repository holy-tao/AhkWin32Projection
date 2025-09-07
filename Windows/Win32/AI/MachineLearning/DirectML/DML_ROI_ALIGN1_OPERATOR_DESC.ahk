#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs an ROI align operation, as described in the [Mask R-CNN](https://arxiv.org/abs/1703.06870) paper. In summary, the operation extracts cropped windows from the input image tensor, and resizes them to a common output size specified by the last 2 dimensions of *OutputTensor* using the specified *InterpolationMode*.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ROI_ALIGN1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 72

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
     * A tensor containing the regions of interest (ROI) data, a series of bounding boxes in floating-point coordinates that point into the X and Y dimensions of the input tensor. The allowed dimensions of *ROITensor* are `{ NumROIs, 4 }`, `{ 1, NumROIs, 4 }`, or `{ 1, 1, NumROIs, 4 }`. For each ROI, the values will be the coordinates of its top-left and bottom-right corners in the order `[x1, y1, x2, y2]`. Regions can be empty, meaning that all output pixels come from the single input coordinate, and regions can be inverted (for example, x2 less than x1), meaning that the output receives a mirrored/flipped version of the input. These coordinates are first scaled by *SpatialScaleX* and *SpatialScaleY*, but if they are both 1.0, then the region rectangles simply correspond directly to the input tensor coordinates.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ROITensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the batch indices to extract the ROIs from. The allowed dimensions of *BatchIndicesTensor* are `{ NumROIs }`, `{ 1, NumROIs }`, `{ 1, 1, NumROIs }`, or `{ 1, 1, 1, NumROIs }`. Each value is the index of a batch from *InputTensor*. The behavior is undefined if the values are not in the range `[0, BatchCount)`.
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
     * The reduction function to use when reducing across all input samples that contribute to an output element (**DML_REDUCE_FUNCTION_AVERAGE** or **DML_REDUCE_FUNCTION_MAX**). The number of input samples to reduce across is bounded by *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
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
     * * **DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR**. Uses the *nearest nighbor* algorithm, which chooses the input element nearest to the corresponding pixel center for each output element.
     * * **DML_INTERPOLATION_MODE_LINEAR**. Uses the *bilinear* algorithm, which computes the output element by doing the weighted average of the 2 nearest neighboring input elements per dimension. Since only 2 dimensions are resized, the weighted average is computed on a total of 4 input elements for each output element.
     * @type {Integer}
     */
    InterpolationMode {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The X (or width) component of the scaling factor to multiply the *ROITensor* coordinates by in order to make them proportionate to *InputHeight* and *InputWidth*. For example, if *ROITensor* contains normalized coordinates (values in the range `[0..1]`), then *SpatialScaleX* would usually have the same value as *InputWidth*.
     * @type {Float}
     */
    SpatialScaleX {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The Y (or height) component of the scaling factor to multiply the *ROITensor* coordinates by in order to make them proportionate to *InputHeight* and *InputWidth*. For example, if *ROITensor* contains normalized coordinates (values in the range `[0..1]`), then *SpatialScaleY* would usually have the same value as *InputHeight*.
     * @type {Float}
     */
    SpatialScaleY {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The offset from `(0,0)` of the input coordinates to the top-left pixel center, typically either 0 or 0.5. When this value is 0, the top-left corner of the pixel is used instead of its center, which usually won't give the expected result, but is useful for compatibility with some frameworks. When this value is 0.5, pixels are treated as being at the center, which is the same behavior as [DML_ROI_ALIGN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align_operator_desc).
     * @type {Float}
     */
    InputPixelOffset {
        get => NumGet(this, 48, "float")
        set => NumPut("float", value, this, 48)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The offset from the top-left pixel center to `(0,0)` of the output coordinates, typically either 0 or -0.5. When this value is 0, the top-left corner of the pixel is used instead of its center, which usually won't give the expected result, but is useful for compatibility with some frameworks. When this value is -0.5, pixels are treated as being at the center, which is the same behavior as [DML_ROI_ALIGN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align_operator_desc).
     * @type {Float}
     */
    OutputPixelOffset {
        get => NumGet(this, 52, "float")
        set => NumPut("float", value, this, 52)
    }

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The value to read from *InputTensor* when the ROIs are outside the bounds of *InputTensor*. This can happen when the values obtained after scaling *ROITensor* by *SpatialScaleX* and *SpatialScaleY* are bigger than *InputWidth* and *InputHeight*.
     * @type {Float}
     */
    OutOfBoundsInputValue {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The minimum number of input samples to use for every output element. The operator will calculate the number of input samples by doing *ScaledCropSize* / *OutputSize*, and then clamping it to *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     * @type {Integer}
     */
    MinimumSamplesPerOutput {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The maximum number of input samples to use for every output element. The operator will calculate the number of input samples by doing *ScaledCropSize* / *OutputSize*, and then clamping it to *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     * @type {Integer}
     */
    MaximumSamplesPerOutput {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: **[BOOL](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The output sample points in each region should be stretched out to the very corners of the region rather than evenly spread within the region. The default value is **FALSE**, which is the same behavior as [DML_ROI_ALIGN_OPERATOR_DESC](ns-directml-dml_roi_align_operator_desc.md).
     * @type {Integer}
     */
    AlignRegionsToCorners {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }
}
