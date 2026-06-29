#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes an image format.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/ns-magnification-magimageheader
 * @namespace Windows.Win32.UI.Magnification
 */
export default struct MAGIMAGEHEADER {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width of the image.
     */
    width : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height of the image.
     */
    height : UInt32

    /**
     * Type: <b>WICPixelFormatGUID</b>
     * 
     * A WICPixelFormatGUID (declared in wincodec.h) that specifies the pixel format of the image. For a list of available pixel formats, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">Native Pixel Formats</a> topic.
     */
    format : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The stride, or number of bytes in a row of the image.
     */
    stride : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset of the start of the image data from the beginning of the file.
     */
    offset : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the data.
     */
    cbSize : IntPtr := this.Size

}
