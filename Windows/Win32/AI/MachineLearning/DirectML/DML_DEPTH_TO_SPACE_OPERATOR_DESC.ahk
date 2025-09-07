#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Rearranges (permutes) data from depth into blocks of spatial data. The operator outputs a copy of the input tensor where values from the depth dimension are moved in spatial blocks to the height and width dimensions. (DML_DEPTH_TO_SPACE_OPERATOR_DESC)
 * @remarks
 * A newer version of this operator, [DML_DEPTH_TO_SPACE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc), was introduced in `DML_FEATURE_LEVEL_2_1`.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_depth_to_space_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_DEPTH_TO_SPACE_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from. The input tensor's dimensions are `{ BatchCount, InputChannelCount, InputHeight, InputWidth }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The output tensor's dimensions are `{ BatchCount, OutputChannelCount, OutputHeight, OutputWidth }`, where:
     * 
     * * OutputChannelCount is computed as InputChannelCount / (*BlockSize* * *BlockSize*).
     * * OutputHeight is computed as InputHeight * *BlockSize*.
     * * OutputWidth is computed as InputWidth * *BlockSize*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The width and height of the blocks that are moved.
     * @type {Integer}
     */
    BlockSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
