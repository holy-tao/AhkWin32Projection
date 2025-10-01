#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Computes backpropagation gradients for [ROI_ALIGN](/windows/win32/api/directml/ns-directml-dml_roi_align_operator_desc) and [ROI_ALIGN1](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_roi_align_grad_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ROI_ALIGN_GRAD_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data from the forward pass with dimensions `{ BatchCount, ChannelCount, InputHeight, InputWidth }`. This tensor *must* be supplied when `OutputROIGradientTensor` is supplied, or when `ReductionFunction == DML_REDUCE_FUNCTION_MAX`. This is the same tensor that would be supplied to `InputTensor` for **DML_OPERATOR_ROI_ALIGN** or **DML_OPERATOR_ROI_ALIGN1**.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputGradientTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the regions of interest (ROI) data&mdash;a series of bounding boxes in floating point coordinates that point into the X and Y dimensions of the input tensor. The allowed dimensions of `ROITensor` are `{ NumROIs, 4 }`, `{ 1, NumROIs, 4 }`, or `{ 1, 1, NumROIs, 4 }`. For each ROI, the values will be the coordinates of its top-left and bottom-right corners in the order `[x1, y1, x2, y2]`. Regions can be empty, meaning that all output pixels come from the single input coordinate, and regions can be inverted (for example, x2 less than x1), meaning that the output receives a mirrored/flipped version of the input. These coordinates are first scaled by `SpatialScaleX` and `SpatialScaleY`, but if they are both 1.0 then the region rectangles simply correspond directly to the input tensor coordinates. This is the same tensor that would be supplied to `ROITensor` for **DML_OPERATOR_ROI_ALIGN** or **DML_OPERATOR_ROI_ALIGN1**.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ROITensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the batch indices to extract the ROIs from. The allowed dimensions of `BatchIndicesTensor` are `{ NumROIs }`, `{ 1, NumROIs }`, `{ 1, 1, NumROIs }`, or `{ 1, 1, 1, NumROIs }`. Each value is the index of a batch from `InputTensor`. The behavior is undefined if the values are not in the range `[0, BatchCount)`. This is the same tensor that would be supplied to `BatchIndicesTensor` for **DML_OPERATOR_ROI_ALIGN** or **DML_OPERATOR_ROI_ALIGN1**.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BatchIndicesTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients with respect to `InputTensor`. Typically this tensor would have the same sizes as the *input* of the corresponding **DML_OPERATOR_ROI_ALIGN1** in the forward pass. If `OutputROIGradientTensor` is not supplied, then `OutputGradientTensor` *must* be supplied.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputGradientTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An output tensor containing the backpropagated gradients with respect to `ROITensor`. This tensor needs to have the same sizes as `ROITensor`. If `OutputGradientTensor` is not supplied, then `OutputROIGradientTensor` *must* be supplied.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputROIGradientTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: [**DML_REDUCE_FUNCTION**](/windows/win32/api/directml/ne-directml-dml_reduce_function)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::ReductionFunction](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Integer}
     */
    ReductionFunction {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: [**DML_INTERPOLATION_MODE**](/windows/win32/api/directml/ne-directml-dml_interpolation_mode)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::InterpolationMode](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Integer}
     */
    InterpolationMode {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Type: [**FLOAT**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::SpatialScaleX](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Float}
     */
    SpatialScaleX {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * Type: [**FLOAT**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::SpatialScaleY](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Float}
     */
    SpatialScaleY {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }

    /**
     * Type: [**FLOAT**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::InputPixelOffset](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Float}
     */
    InputPixelOffset {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * Type: [**FLOAT**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::OutputPixelOffset](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Float}
     */
    OutputPixelOffset {
        get => NumGet(this, 68, "float")
        set => NumPut("float", value, this, 68)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::MinimumSamplesPerOutput](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Integer}
     */
    MinimumSamplesPerOutput {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::MaximumSamplesPerOutput](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Integer}
     */
    MaximumSamplesPerOutput {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: [**BOOL**](/windows/desktop/winprog/windows-data-types)
     * 
     * See [DML_ROI_ALIGN1_OPERATOR_DESC::AlignRegionsToCorners](/windows/win32/api/directml/ns-directml-dml_roi_align1_operator_desc).
     * @type {Integer}
     */
    AlignRegionsToCorners {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
