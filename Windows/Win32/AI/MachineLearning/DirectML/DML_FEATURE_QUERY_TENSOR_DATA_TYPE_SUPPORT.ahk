#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used to query a DirectML device for its support for a particular data type within tensors.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_feature_query_tensor_data_type_support
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_FEATURE_QUERY_TENSOR_DATA_TYPE_SUPPORT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The data type about which you're querying for support.
     * @type {Integer}
     */
    DataType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
