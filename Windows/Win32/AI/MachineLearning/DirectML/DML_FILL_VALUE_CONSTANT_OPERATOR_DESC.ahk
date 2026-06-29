#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }
#Import ".\DML_SCALAR_UNION.ahk" { DML_SCALAR_UNION }

/**
 * Fills a tensor with the given constant *Value*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_fill_value_constant_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FILL_VALUE_CONSTANT_OPERATOR_DESC {
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
     * The data type of the *Value* field, which must match *OutputTensor.DataType*.
     */
    ValueDataType : DML_TENSOR_DATA_TYPE

    /**
     * Type: **[DML_SCALAR_UNION](/windows/win32/api/directml/ns-directml-dml_scalar_union)**
     * 
     * A constant value to fill the output, with *ValueDataType* determining how to interpret the field.
     */
    Value : DML_SCALAR_UNION

}
