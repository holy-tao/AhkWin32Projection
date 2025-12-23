#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants controlling the transform applied in the DirectML operators [DML_OPERATOR_DEPTH_TO_SPACE1](/windows/win32/api/directml/ne-directml-dml_operator_type) and **DML_OPERATOR_SPACE_TO_DEPTH1**.
 * @remarks
 * See [DML_DEPTH_TO_SPACE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc) and [DML_SPACE_TO_DEPTH1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_space_to_depth1_operator_desc) documentation for examples showing the effect of these values.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_depth_space_order
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_DEPTH_SPACE_ORDER extends Win32Enum{

    /**
     * Causes tensors used in [DML_DEPTH_TO_SPACE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc) and [DML_SPACE_TO_DEPTH1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_space_to_depth1_operator_desc) to be interpreted with the following layouts, where dimensions in parenthesis are flattened together.
     * 
     * - **Depth version**: [Batch, (BlockHeight, BlockWidth, Channels), Height, Width]
     * - **Space version**: [Batch, Channels, (Height, BlockHeight), (Width, BlockWidth)]
     * @type {Integer (Int32)}
     */
    static DML_DEPTH_SPACE_ORDER_DEPTH_COLUMN_ROW => 0

    /**
     * Causes tensors used in [DML_DEPTH_TO_SPACE1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_depth_to_space1_operator_desc) and [DML_SPACE_TO_DEPTH1_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_space_to_depth1_operator_desc) to be interpreted with the following layouts, where dimensions in parenthesis are flattened together.
     * 
     * - **Depth version**: [Batch, (Channels, BlockHeight, BlockWidth), Height, Width]
     * - **Space version**: [Batch, Channels, (Height, BlockHeight), (Width, BlockWidth)]
     * @type {Integer (Int32)}
     */
    static DML_DEPTH_SPACE_ORDER_COLUMN_ROW_DEPTH => 1
}
