#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Rearranges blocks of spatial data into depth. The operator outputs a copy of the input tensor where values from the height and width dimensions are moved to the depth dimension.
 * @remarks
 * 
  * When the *Order* parameter is set to [DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW](/windows/win32/api/directml/ne-directml-dml_depth_space_order), this operator is equivalent to [DML_SPACE_TO_DEPTH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_space_to_depth_operator_desc).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_space_to_depth1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_SPACE_TO_DEPTH1_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from. The input tensor's dimensions are `{ Batch, Channels, Height, Width }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The output tensor's dimensions are `{ Batch, Channels / (BlockSize * BlockSize), Height * BlockSize, Width * BlockSize }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The width and height of the Blocks that are moved.
     * @type {Integer}
     */
    BlockSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[DML_DEPTH_SPACE_ORDER](/windows/win32/api/directml/ne-directml-dml_depth_space_order)**
     * 
     * See [DML_DEPTH_SPACE_ORDER](/windows/win32/api/directml/ne-directml-dml_depth_space_order).
     * @type {Integer}
     */
    Order {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
