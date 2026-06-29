#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }

/**
 * Contains properties for the binding of the type image.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_image_binding_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_IMAGE_BINDING_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_tensor_data_type">WINML_TENSOR_DATA_TYPE</a> describing the element tensor data type.
     */
    ElementType : WINML_TENSOR_DATA_TYPE

    /**
     * The image tensor dimension count.
     */
    NumDimensions : UInt32

    /**
     * Pointer to the shape of the image.
     */
    pShape : IntPtr

    /**
     * Size of image data in bytes.
     */
    DataSize : UInt32

    /**
     * Pointer to the image data.
     */
    pData : IntPtr

}
