#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information about an image in an image list. This structure is used with the IImageList::GetImageInfo function. (IMAGEINFO)
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-imageinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IMAGEINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to the bitmap that contains the images.
     * @type {Pointer<HBITMAP>}
     */
    hbmImage {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HBITMAP</a></b>
     * 
     * A handle to a monochrome bitmap that contains the masks for the images. If the image list does not contain a mask, this member is <b>NULL</b>.
     * @type {Pointer<HBITMAP>}
     */
    hbmMask {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Not used. This member should always be zero.
     * @type {Integer}
     */
    Unused1 {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * Not used. This member should always be zero.
     * @type {Integer}
     */
    Unused2 {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The bounding rectangle of the specified image within the bitmap specified by 
     * 					<b>hbmImage</b>.
     * @type {RECT}
     */
    rcImage{
        get {
            if(!this.HasProp("__rcImage"))
                this.__rcImage := RECT(this.ptr + 24)
            return this.__rcImage
        }
    }
}
