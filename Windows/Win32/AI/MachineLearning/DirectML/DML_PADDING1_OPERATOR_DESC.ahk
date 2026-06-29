#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_PADDING_MODE.ahk" { DML_PADDING_MODE }
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }
#Import ".\DML_SCALAR_UNION.ahk" { DML_SCALAR_UNION }

/**
 * The DML_PADDING1_OPERATOR_DESC structure (directml.h) inflates the input tensor with constant or mirrored values on the edges, and writes the result to the output.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_padding1_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_PADDING1_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output data. For each dimension *i*, `OutputTensor.Sizes[i] = InputTensor.Sizes[i] + StartPadding[i] + EndPadding[i]`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[DML_PADDING_MODE](/windows/win32/api/directml/ne-directml-dml_padding_mode)\***
     * 
     * The padding mode to use when filling the padding regions.
     * 
     * - **DML_PADDING_MODE_CONSTANT**. Uses a single constant value defined by *PaddingValue* for all padding values (see **Example 1**).
     * - **DML_PADDING_MODE_EDGE**. For each dimension, use the edge values of that dimension for all padding values (see **Example 2**).
     * - **DML_PADDING_MODE_REFLECTION**. Mirror the values of the tensor as if we folded it right on the edges, which means that edges are not mirrored. Note that `StartPadding[i] >= InputTensor.Sizes[i]`, and `EndPadding[i] >= InputTensor.Sizes[i]` is valid, which means that we can mirror new padding regions periodically by folding them over previous padding regions (see **Example 3**).
     * - **DML_PADDING_MODE_SYMMETRIC**. Similar to **DML_PADDING_MODE_REFLECTION**, but edges are also mirrored. Note that `StartPadding[i] > InputTensor.Sizes[i]`, and `EndPadding[i] > InputTensor.Sizes[i]` is valid, which means that we can mirror new padding regions periodically by folding them over previous padding regions (see **Example 4**). **This mode was introduced in feature level `DML_FEATURE_LEVEL_3_0`**.
     */
    PaddingMode : DML_PADDING_MODE

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type of the *PaddingValue* member, which must match *OutputTensor.DataType*.
     */
    PaddingValueDataType : DML_TENSOR_DATA_TYPE

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * The padding value to use when `PaddingMode == DML_PADDING_MODE_CONSTANT`, with *PaddingValueDataType* determining how to interpret the field. This value is ignored for other padding modes.
     */
    PaddingValue : DML_SCALAR_UNION

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * The size of the arrays pointed to by *StartPadding* and *EndPadding*. This value must be the same value as the dimension count of *InputTensor* and *OutputTensor*.
     */
    DimensionCount : UInt32

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [UINT](/windows/desktop/winprog/windows-data-types)\***
     * 
     * The sizes of the padding regions to add at the beginning of each dimension. For each dimension *i*, `StartPadding[i] = OutputTensor.Sizes[i] - InputTensor.Sizes[i] - EndPadding[i]`.
     */
    StartPadding : IntPtr

    /**
     * Type: \_Field\_size\_(DimensionCount) **const [UINT](/windows/desktop/winprog/windows-data-types)\***
     * 
     * The sizes of the padding regions to add at the end of each dimension. For each dimension *i*, `EndPadding[i] = OutputTensor.Sizes[i] - InputTensor.Sizes[i] - StartPadding[i]`.
     */
    EndPadding : IntPtr

}
