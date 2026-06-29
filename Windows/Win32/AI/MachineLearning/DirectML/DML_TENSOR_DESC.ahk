#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_TYPE.ahk" { DML_TENSOR_TYPE }

/**
 * A generic container for a DirectML tensor description.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_tensor_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_TENSOR_DESC {
    #StructPack 8

    /**
     * Type: [**DML_TENSOR_TYPE**](./ne-directml-dml_tensor_type.md)
     * 
     * The type of the tensor description. See <a href="https://docs.microsoft.com/windows/win32/api/directml/ne-directml-dml_tensor_type">DML_TENSOR_TYPE</a> for the available types.
     */
    Type : DML_TENSOR_TYPE

    /**
     * Type: <b>const void*</b>
     * 
     * A pointer to the tensor description. The type of the pointed-to struct must match the value specified in <i>Type</i>.
     */
    Desc : IntPtr

}
