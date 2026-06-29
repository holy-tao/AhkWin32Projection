#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }

/**
 * Used to query a DirectML device for its support for a particular data type within tensors.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_feature_query_tensor_data_type_support
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FEATURE_QUERY_TENSOR_DATA_TYPE_SUPPORT {
    #StructPack 4

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type about which you're querying for support.
     */
    DataType : DML_TENSOR_DATA_TYPE

}
