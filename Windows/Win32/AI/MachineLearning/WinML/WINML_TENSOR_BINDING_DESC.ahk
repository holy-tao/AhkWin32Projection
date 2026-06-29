#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }

/**
 * Contains description properties of the tensor binding.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_tensor_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_TENSOR_BINDING_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the WinML tensor data type.
     */
    DataType : WINML_TENSOR_DATA_TYPE

    /**
     * The WinML tensor dimension count.
     */
    NumDimensions : UInt32

    /**
     * A pointer to the shape of the WinML tensor.
     */
    pShape : IntPtr

    /**
     * The size of tensor data in bytes.
     */
    DataSize : UInt32

    /**
     * Pointer to the tensor data.
     */
    pData : IntPtr

}
