#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains properties for the binding of the type image.
 * @see https://docs.microsoft.com/windows/win32/api//winml/ns-winml-winml_image_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_IMAGE_BINDING_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> describing the element tensor data type.
     * @type {Integer}
     */
    ElementType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The image tensor dimension count.
     * @type {Integer}
     */
    NumDimensions {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the shape of the image.
     * @type {Pointer<Integer>}
     */
    pShape {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Size of image data in bytes.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to the image data.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
