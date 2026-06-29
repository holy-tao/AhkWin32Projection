#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_DEPTH_SPACE_ORDER.ahk" { DML_DEPTH_SPACE_ORDER }

/**
 * Rearranges blocks of spatial data into depth. The operator outputs a copy of the input tensor where values from the height and width dimensions are moved to the depth dimension. (DML_SPACE_TO_DEPTH1_OPERATOR_DESC)
 * @remarks
 * When the *Order* parameter is set to [DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW](/windows/win32/api/directml/ne-directml-dml_depth_space_order), this operator is equivalent to [DML_SPACE_TO_DEPTH_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_space_to_depth_operator_desc).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_space_to_depth1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_SPACE_TO_DEPTH1_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from. The input tensor's dimensions are `{ Batch, Channels, Height, Width }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The output tensor's dimensions are `{ Batch, Channels / (BlockSize * BlockSize), Height * BlockSize, Width * BlockSize }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The width and height of the Blocks that are moved.
     */
    BlockSize : UInt32

    /**
     * Type: **[DML_DEPTH_SPACE_ORDER](/windows/win32/api/directml/ne-directml-dml_depth_space_order)**
     * 
     * See [DML_DEPTH_SPACE_ORDER](/windows/win32/api/directml/ne-directml-dml_depth_space_order).
     */
    Order : DML_DEPTH_SPACE_ORDER

}
