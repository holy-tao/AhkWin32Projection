#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains description properties of the sequence variable.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_sequence_variable_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_SEQUENCE_VARIABLE_DESC extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the element tensor data type.
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
