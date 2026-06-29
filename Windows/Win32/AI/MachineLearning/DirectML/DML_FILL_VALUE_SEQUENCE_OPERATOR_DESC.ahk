#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }
#Import ".\DML_SCALAR_UNION.ahk" { DML_SCALAR_UNION }

/**
 * Fills a tensor with a sequence.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_fill_value_sequence_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FILL_VALUE_SEQUENCE_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor may have any size.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **[DML_TENSOR_DATA_TYPE](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)**
     * 
     * The data type of *Value* field, which must match *OutputTensor.DataType*.
     */
    ValueDataType : DML_TENSOR_DATA_TYPE

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * The initial value to fill the first element in the output, with *ValueDataType* determining how to interpret the field.
     */
    ValueStart : DML_SCALAR_UNION

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * A step to add to the value for each element written, with *ValueDataType* determining how to interpret the field.
     */
    ValueDelta : DML_SCALAR_UNION

}
