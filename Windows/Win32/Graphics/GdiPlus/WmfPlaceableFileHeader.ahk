#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PWMFRect16.ahk

/**
 * The WmfPlaceableFileHeader structure defines the fields of a placeable metafile header. Placeable metafiles were created as a way of specifying how a metafile is mapped and scaled on a display device.
 * @remarks
 * 
 * Although placeable metafiles are quite common, they are not directly supported by the Windows API. To display a placeable metafile using the Windows API, you must first strip the placeable metafile header from the file. This is typically performed by copying the metafile to a temporary file starting at file offset 22 (0x16). This is because each placeable metafile begins with a 22-byte header that is followed by a standard metafile.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusmetaheader/ns-gdiplusmetaheader-wmfplaceablefileheader
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class WmfPlaceableFileHeader extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>UINT32</b>
     * 
     * Identification value that indicates the presence of a placeable metafile header. This value is always 0x9AC6CDD7.
     * @type {Integer}
     */
    Key {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * Handle to the metafile in memory. When written to disk, this field is not used and will always contains the value 0.
     * @type {Integer}
     */
    Hmf {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/gdiplusmetaheader/ns-gdiplusmetaheader-pwmfrect16">PWMFRect16</a></b>
     * 
     * Destination rectangle, measured in twips, for displaying the metafile.
     * @type {PWMFRect16}
     */
    BoundingBox{
        get {
            if(!this.HasProp("__BoundingBox"))
                this.__BoundingBox := PWMFRect16(8, this)
            return this.__BoundingBox
        }
    }

    /**
     * Type: <b>INT16</b>
     * 
     * Number of twips per inch used to represent the image.
     * 
     * Normally, there are 1440 twips per inch; however, this number can be changed to scale the image. 
     * 						<ul>
     * <li>A value of 720 specifies that the image is twice its normal size. </li>
     * <li>A value of 360 specifies that the image is four times its normal size. </li>
     * <li>A value of 2880 specifies that the image is half its normal size. </li>
     * </ul>
     * @type {Integer}
     */
    Inch {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Not used and is always set to 0.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * Checksum for the previous 10 <b>WORD</b><b>s</b> in the header. This value can be used to determine whether the metafile has become corrupted.
     * @type {Integer}
     */
    Checksum {
        get => NumGet(this, 24, "short")
        set => NumPut("short", value, this, 24)
    }
}
