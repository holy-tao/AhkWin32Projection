#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes an image format.
 * @see https://learn.microsoft.com/windows/win32/api/magnification/ns-magnification-magimageheader
 * @namespace Windows.Win32.UI.Magnification
 */
class MAGIMAGEHEADER extends Win32Struct {
    static sizeof => 40

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
     * @type {Guid}
     */
    format {
        get {
            if(!this.HasProp("__format"))
                this.__format := Guid(8, this)
            return this.__format
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The stride, or number of bytes in a row of the image.
     * @type {Integer}
     */
    stride {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset of the start of the image data from the beginning of the file.
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the data.
     * @type {Pointer}
     */
    cbSize {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
