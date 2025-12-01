#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DML_SIZE_2D.ahk

/**
 * Performs a MaxPool function across the input tensor (according to regions of interest, or ROIs).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_roi_pooling_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ROI_POOLING_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

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
     * A tensor containing the regions of interest (ROI) data. The expected dimensions of `ROITensor` are `{ 1, 1, NumROIs, 5 }` and the data for each ROI is `[BatchID, x1, y1, x2, y2]`. x1, y1, x2, y2 are the inclusive coordinates of the corners of each ROI and x2 >= x1, y2 >= y1.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ROITensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output data. The expected dimensions of *OutputTensor* are `{ NumROIs, InputChannelCount, PooledSize.Height, PooledSize.Width }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Multiplicative spatial scale factor used to translate the ROI coordinates from their input scale to the scale used when pooling.
     * @type {Float}
     */
    SpatialScale {
        get => NumGet(this, 24, "float")
        set => NumPut("float", value, this, 24)
    }

    /**
     * Type: [**DML_SIZE_2D**](/windows/win32/api/directml/ns-directml-dml_size_2d)
     * 
     * The ROI pool output size (height, width), which must match the last 2 dimensions of *OutputTensor*.
     * @type {DML_SIZE_2D}
     */
    PooledSize{
        get {
            if(!this.HasProp("__PooledSize"))
                this.__PooledSize := DML_SIZE_2D(32, this)
            return this.__PooledSize
        }
    }
}
