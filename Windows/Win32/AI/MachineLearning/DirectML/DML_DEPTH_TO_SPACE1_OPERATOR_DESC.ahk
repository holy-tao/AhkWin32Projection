#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_DEPTH_SPACE_ORDER.ahk" { DML_DEPTH_SPACE_ORDER }

/**
 * Rearranges (permutes) data from depth into blocks of spatial data. The operator outputs a copy of the input tensor where values from the depth dimension are moved in spatial blocks to the height and width dimensions. (DML_DEPTH_TO_SPACE1_OPERATOR_DESC)
 * @remarks
 * When *Order* is set to [DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW](/windows/win32/api/directml/ne-directml-dml_depth_space_order), **DML_DEPTH_TO_SPACE1_OPERATOR_DESC** is equivalent to [DML_DEPTH_TO_SPACE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_DEPTH_TO_SPACE1_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from. The input tensor's dimensions are `{ BatchCount, InputChannelCount, InputHeight, InputWidth }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The output tensor's dimensions are `{ BatchCount, OutputChannelCount, OutputHeight, OutputWidth }`, where:
     * 
     * * OutputChannelCount is computed as InputChannelCount / (`BlockSize` * `BlockSize`)
     * * OutputHeight is computed as InputHeight * `BlockSize`
     * * OutputWidth is computed as InputWidth * `BlockSize`
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The width and height of the blocks that are moved.
     */
    BlockSize : UInt32

    /**
     * Type: **[DML_DEPTH_SPACE_ORDER](/windows/win32/api/directml/ne-directml-dml_depth_space_order)**
     * 
     * See [DML_DEPTH_SPACE_ORDER](/windows/win32/api/directml/ne-directml-dml_depth_space_order).
     */
    Order : DML_DEPTH_SPACE_ORDER

}
