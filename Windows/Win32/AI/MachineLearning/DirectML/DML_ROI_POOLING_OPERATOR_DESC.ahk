#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_SIZE_2D.ahk" { DML_SIZE_2D }

/**
 * Performs a MaxPool function across the input tensor (according to regions of interest, or ROIs).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_roi_pooling_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_ROI_POOLING_OPERATOR_DESC {
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
     * A tensor containing the regions of interest (ROI) data. The expected dimensions of `ROITensor` are `{ 1, 1, NumROIs, 5 }` and the data for each ROI is `[BatchID, x1, y1, x2, y2]`. x1, y1, x2, y2 are the inclusive coordinates of the corners of each ROI and x2 >= x1, y2 >= y1.
     */
    ROITensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output data. The expected dimensions of *OutputTensor* are `{ NumROIs, InputChannelCount, PooledSize.Height, PooledSize.Width }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Multiplicative spatial scale factor used to translate the ROI coordinates from their input scale to the scale used when pooling.
     */
    SpatialScale : Float32

    /**
     * Type: [**DML_SIZE_2D**](/windows/win32/api/directml/ns-directml-dml_size_2d)
     * 
     * The ROI pool output size (height, width), which must match the last 2 dimensions of *OutputTensor*.
     */
    PooledSize : DML_SIZE_2D

}
