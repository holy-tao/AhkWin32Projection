#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_INTERPOLATION_MODE.ahk" { DML_INTERPOLATION_MODE }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DML_REDUCE_FUNCTION.ahk" { DML_REDUCE_FUNCTION }

/**
 * Performs an ROI align operation, as described in the [Mask R-CNN](https://arxiv.org/abs/1703.06870) paper. In summary, the operation extracts cropped windows from the input image tensor, and resizes them to a common output size specified by the last 2 dimensions of *OutputTensor* using the specified *InterpolationMode*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ROI_ALIGN1_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data with dimensions `{ BatchCount, ChannelCount, InputHeight, InputWidth }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the regions of interest (ROI) data, a series of bounding boxes in floating-point coordinates that point into the X and Y dimensions of the input tensor. The allowed dimensions of *ROITensor* are `{ NumROIs, 4 }`, `{ 1, NumROIs, 4 }`, or `{ 1, 1, NumROIs, 4 }`. For each ROI, the values will be the coordinates of its top-left and bottom-right corners in the order `[x1, y1, x2, y2]`. Regions can be empty, meaning that all output pixels come from the single input coordinate, and regions can be inverted (for example, x2 less than x1), meaning that the output receives a mirrored/flipped version of the input. These coordinates are first scaled by *SpatialScaleX* and *SpatialScaleY*, but if they are both 1.0, then the region rectangles simply correspond directly to the input tensor coordinates.
     */
    ROITensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the batch indices to extract the ROIs from. The allowed dimensions of *BatchIndicesTensor* are `{ NumROIs }`, `{ 1, NumROIs }`, `{ 1, 1, NumROIs }`, or `{ 1, 1, 1, NumROIs }`. Each value is the index of a batch from *InputTensor*. The behavior is undefined if the values are not in the range `[0, BatchCount)`.
     */
    BatchIndicesTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output data. The expected dimensions of *OutputTensor* are `{ NumROIs, ChannelCount, OutputHeight, OutputWidth }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[DML_REDUCE_FUNCTION](/windows/win32/api/directml/ne-directml-dml_reduce_function)**
     * 
     * The reduction function to use when reducing across all input samples that contribute to an output element (**DML_REDUCE_FUNCTION_AVERAGE** or **DML_REDUCE_FUNCTION_MAX**). The number of input samples to reduce across is bounded by *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     */
    ReductionFunction : DML_REDUCE_FUNCTION

    /**
     * Type: **[DML_INTERPOLATION_MODE](/windows/win32/api/directml/ne-directml-dml_interpolation_mode)**
     * 
     * The interpolation mode to use when resizing the regions.
     * 
     * * **DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR**. Uses the *nearest nighbor* algorithm, which chooses the input element nearest to the corresponding pixel center for each output element.
     * * **DML_INTERPOLATION_MODE_LINEAR**. Uses the *bilinear* algorithm, which computes the output element by doing the weighted average of the 2 nearest neighboring input elements per dimension. Since only 2 dimensions are resized, the weighted average is computed on a total of 4 input elements for each output element.
     */
    InterpolationMode : DML_INTERPOLATION_MODE

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The X (or width) component of the scaling factor to multiply the *ROITensor* coordinates by in order to make them proportionate to *InputHeight* and *InputWidth*. For example, if *ROITensor* contains normalized coordinates (values in the range `[0..1]`), then *SpatialScaleX* would usually have the same value as *InputWidth*.
     */
    SpatialScaleX : Float32

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The Y (or height) component of the scaling factor to multiply the *ROITensor* coordinates by in order to make them proportionate to *InputHeight* and *InputWidth*. For example, if *ROITensor* contains normalized coordinates (values in the range `[0..1]`), then *SpatialScaleY* would usually have the same value as *InputHeight*.
     */
    SpatialScaleY : Float32

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The offset from `(0,0)` of the input coordinates to the top-left pixel center, typically either 0 or 0.5. When this value is 0, the top-left corner of the pixel is used instead of its center, which usually won't give the expected result, but is useful for compatibility with some frameworks. When this value is 0.5, pixels are treated as being at the center, which is the same behavior as [DML_ROI_ALIGN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align_operator_desc).
     */
    InputPixelOffset : Float32

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The offset from the top-left pixel center to `(0,0)` of the output coordinates, typically either 0 or -0.5. When this value is 0, the top-left corner of the pixel is used instead of its center, which usually won't give the expected result, but is useful for compatibility with some frameworks. When this value is -0.5, pixels are treated as being at the center, which is the same behavior as [DML_ROI_ALIGN_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_roi_align_operator_desc).
     */
    OutputPixelOffset : Float32

    /**
     * Type: **[FLOAT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The value to read from *InputTensor* when the ROIs are outside the bounds of *InputTensor*. This can happen when the values obtained after scaling *ROITensor* by *SpatialScaleX* and *SpatialScaleY* are bigger than *InputWidth* and *InputHeight*.
     */
    OutOfBoundsInputValue : Float32

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The minimum number of input samples to use for every output element. The operator will calculate the number of input samples by doing *ScaledCropSize* / *OutputSize*, and then clamping it to *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     */
    MinimumSamplesPerOutput : UInt32

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The maximum number of input samples to use for every output element. The operator will calculate the number of input samples by doing *ScaledCropSize* / *OutputSize*, and then clamping it to *MinimumSamplesPerOutput* and *MaximumSamplesPerOutput*.
     */
    MaximumSamplesPerOutput : UInt32

    /**
     * Type: **[BOOL](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The output sample points in each region should be stretched out to the very corners of the region rather than evenly spread within the region. The default value is **FALSE**, which is the same behavior as [DML_ROI_ALIGN_OPERATOR_DESC](ns-directml-dml_roi_align_operator_desc.md).
     */
    AlignRegionsToCorners : BOOL

}
