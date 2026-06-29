#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_INTERPOLATION_MODE.ahk" { DML_INTERPOLATION_MODE }
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_SIZE_2D.ahk" { DML_SIZE_2D }

/**
 * Upsamples the input image, writing the result into the output tensor. The order of the dimensions should be NCHW (BatchSize, ChannelCount, Height, Width) or NCDHW (BatchSize, ChannelCount, Depth, Height, Width), but strides can be used if the data is stored in a different format.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_upsample_2d_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_UPSAMPLE_2D_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the InputTensor are `{ InputBatchCount, InputChannelCount, InputHeight, InputWidth }` for 4D, and `{ InputBatchCount, InputChannelCount, InputDepth, InputHeight, InputWidth }` for 5D.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the OutputTensor are `{ InputBatchCount, InputChannelCount, InputHeight * HeightScale, InputWidth * WidthScale }` for 4D, and `{ InputBatchCount, InputChannelCount, InputDepth, InputHeight * HeightScale, InputWidth * WidthScale }` for 5D.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**DML_SIZE_2D**](/windows/win32/api/directml/ns-directml-dml_size_2d)
     * 
     * The width and height scales of type UINT to apply when upsampling the input. `0 < ScaleSize.Height <= UINT_MAX / InputHeight` and `0 < ScaleSize.Width <= UINT_MAX / InputWidth`.
     */
    ScaleSize : DML_SIZE_2D

    /**
     * Type: **[DML_INTERPOLATION_MODE](/windows/win32/api/directml/ne-directml-dml_interpolation_mode)**
     * 
     * This field determines the kind of interpolation used to choose output pixels.
     * 
     * - [DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR](/windows/win32/api/directml/ne-directml-dml_interpolation_mode). Uses the *Nearest Neighbor* algorithm, which chooses the input element nearest to the corresponding pixel center for each output element.
     * - **DML_INTERPOLATION_MODE_LINEAR**. Uses the *Bilinear* algorithm, which computes the output element by doing the weighted average of the 2 nearest neighboring input elements in the height dimension, and the 2 nearest neighboring input elements in the width dimension, for a total of 4 elements. This is true even if the input/output DimensionCount is 5. That is, samples are only ever averaged along the width and height dimensions, and never along the batch, channel, or depth.
     */
    InterpolationMode : DML_INTERPOLATION_MODE

}
