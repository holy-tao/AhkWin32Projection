#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Provides detail about whether a DirectML device supports a particular data type within tensors.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_feature_data_tensor_data_type_support
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FEATURE_DATA_TENSOR_DATA_TYPE_SUPPORT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the tensor data type is supported within tensors by the DirectML device. Otherwise, <b>FALSE</b>.
     */
    IsSupported : BOOL

}
