#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an image format.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/ns-magnification-magimageheader
 * @namespace Windows.Win32.UI.Magnification
 * @version v4.0.30319
 */
class MAGIMAGEHEADER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The width of the image.
     * @type {Integer}
     */
    width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The height of the image.
     * @type {Integer}
     */
    height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>WICPixelFormatGUID</b>
     * 
     * A WICPixelFormatGUID (declared in wincodec.h) that specifies the pixel format of the image. For a list of available pixel formats, see the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">Native Pixel Formats</a> topic.
     * @type {Pointer<Guid>}
     */
    format {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The stride, or number of bytes in a row of the image.
     * @type {Integer}
     */
    stride {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset of the start of the image data from the beginning of the file.
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the data.
     * @type {Pointer}
     */
    cbSize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 32
    }
}
