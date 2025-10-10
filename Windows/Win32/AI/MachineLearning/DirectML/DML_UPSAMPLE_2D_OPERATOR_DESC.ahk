#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SIZE_2D.ahk

/**
 * Upsamples the input image, writing the result into the output tensor. The order of the dimensions should be NCHW (BatchSize, ChannelCount, Height, Width) or NCDHW (BatchSize, ChannelCount, Depth, Height, Width), but strides can be used if the data is stored in a different format.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_upsample_2d_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_UPSAMPLE_2D_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the InputTensor are `{ InputBatchCount, InputChannelCount, InputHeight, InputWidth }` for 4D, and `{ InputBatchCount, InputChannelCount, InputDepth, InputHeight, InputWidth }` for 5D.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the OutputTensor are `{ InputBatchCount, InputChannelCount, InputHeight * HeightScale, InputWidth * WidthScale }` for 4D, and `{ InputBatchCount, InputChannelCount, InputDepth, InputHeight * HeightScale, InputWidth * WidthScale }` for 5D.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**DML_SIZE_2D**](/windows/win32/api/directml/ns-directml-dml_size_2d)
     * 
     * The width and height scales of type UINT to apply when upsampling the input. `0 < ScaleSize.Height <= UINT_MAX / InputHeight` and `0 < ScaleSize.Width <= UINT_MAX / InputWidth`.
     * @type {DML_SIZE_2D}
     */
    ScaleSize{
        get {
            if(!this.HasProp("__ScaleSize"))
                this.__ScaleSize := DML_SIZE_2D(this.ptr + 16)
            return this.__ScaleSize
        }
    }

    /**
     * Type: **[DML_INTERPOLATION_MODE](/windows/win32/api/directml/ne-directml-dml_interpolation_mode)**
     * 
     * This field determines the kind of interpolation used to choose output pixels.
     * 
     * - [DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR](/windows/win32/api/directml/ne-directml-dml_interpolation_mode). Uses the *Nearest Neighbor* algorithm, which chooses the input element nearest to the corresponding pixel center for each output element.
     * - **DML_INTERPOLATION_MODE_LINEAR**. Uses the *Bilinear* algorithm, which computes the output element by doing the weighted average of the 2 nearest neighboring input elements in the height dimension, and the 2 nearest neighboring input elements in the width dimension, for a total of 4 elements. This is true even if the input/output DimensionCount is 5. That is, samples are only ever averaged along the width and height dimensions, and never along the batch, channel, or depth.
     * @type {Integer}
     */
    InterpolationMode {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
