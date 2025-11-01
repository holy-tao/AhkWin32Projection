#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains description properties of the tensor variable.
 * @see https://docs.microsoft.com/windows/win32/api//winml/ns-winml-winml_tensor_variable_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_TENSOR_VARIABLE_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> containing the element tensor data type.
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The tensor variable dimension count.
     * @type {Integer}
     */
    NumDimensions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The shape of the tensor variable.
     * @type {Pointer<Integer>}
     */
    pShape {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
