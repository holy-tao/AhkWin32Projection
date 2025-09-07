#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Resamples elements from the source to the destination tensor, using the scale factors to compute the destination tensor size. You can use a linear or nearest-neighbor interpolation mode. (DML_RESAMPLE1_OPERATOR_DESC)
 * @remarks
 * When the *InputPixelOffsets* are set to 0.5, and the *OutputPixelOffsets* are set to -0.5, this operator is equivalent to [DML_RESAMPLE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_resample_operator_desc).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_resample1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_RESAMPLE1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor containing the input data.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the output data to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**DML_INTERPOLATION_MODE**](/windows/win32/api/directml/ne-directml-dml_interpolation_mode)
     * 
     * This field determines the kind of interpolation used to choose output pixels.
     * 
     * - **DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR**. Uses the *Nearest Neighbor* algorithm, which chooses the input element nearest to the corresponding pixel center for each output element.
     * 
     * - **DML_INTERPOLATION_MODE_LINEAR**. Uses the *Linear Interpolation* algorithm, which computes the output element by computing the weighted average of the 2 nearest neighboring input elements per dimension. Resampling is supported up to 4 dimensions (quadrilinear), where the weighted average is computed on a total of 16 input elements for each output element.
     * @type {Integer}
     */
    InterpolationMode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of values in the arrays that *Scales*, *InputPixelOffsets*, and *OutputPixelOffsets* point to. This value must match the dimension count of *InputTensor* and *OutputTensor*.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [FLOAT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The scales to apply when resampling the input, where scales > 1 scale up the image and scales < 1 scale down the image for that dimension. Note that the scales don't need to be exactly `OutputSize / InputSize`. If the input after scaling is larger than the output bound, then we crop it to the output size. On the other hand, if the input after scaling is smaller than the output bound, the output edges are clamped.
     * @type {Pointer<Single>}
     */
    Scales {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [FLOAT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The offsets to apply to the input pixels before resampling. When this value is `0`, the top left corner of the pixel is used instead of its center, which usually won't give the expected result. To resample the image by using the center of the pixels and to get the same behavior as [DML_RESAMPLE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_resample_operator_desc), this value must be `0.5`.
     * @type {Pointer<Single>}
     */
    InputPixelOffsets {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [FLOAT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The offsets to apply to the output pixels after resampling. When this value is `0`, the top left corner of the pixel is used instead of its center, which usually won't give the expected result. To resample the image by using the center of the pixels and to get the same behavior as [DML_RESAMPLE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_resample_operator_desc), this value must be `-0.5`.
     * @type {Pointer<Single>}
     */
    OutputPixelOffsets {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
