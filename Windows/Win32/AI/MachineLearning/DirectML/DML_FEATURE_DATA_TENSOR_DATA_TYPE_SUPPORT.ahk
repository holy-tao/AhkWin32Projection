#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides detail about whether a DirectML device supports a particular data type within tensors.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_feature_data_tensor_data_type_support
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_FEATURE_DATA_TENSOR_DATA_TYPE_SUPPORT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the tensor data type is supported within tensors by the DirectML device. Otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    IsSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
