#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ImageItemData class is used to store and retrieve custom image metadata. Windows GDI+ supports custom metadata for JPEG, PNG, and GIF image files.
 * @remarks
 * 
 * To retrieve custom metadata from an image file, call <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-image-getitemdata">Image::GetItemData</a>. To store custom metadata in an image file, follow these steps:
 * 
 * 		    
 * 
 * <ol>
 * <li>Create and initialize an <b>ImageItemData</b> object.</li>
 * <li>Create an <a href="https://docs.microsoft.com/previous-versions/ms534435(v=vs.85)">EncoderParameters</a> object that has an array of one or more <a href="https://docs.microsoft.com/previous-versions/ms534434(v=vs.85)">EncoderParameter</a> objects.</li>
 * <li>For one of the <a href="https://docs.microsoft.com/previous-versions/ms534434(v=vs.85)">EncoderParameter</a> objects in the array, set the Value member to the address of your <b>ImageItemData</b> object. Set the other members as follows: Guid = EncoderImageItems, Type = EncoderParameterValueTypePointer,  NumberOfValues = 1.</li>
 * <li>Pass the address of the <a href="https://docs.microsoft.com/previous-versions/ms534435(v=vs.85)">EncoderParameters</a> object to the <a href="https://docs.microsoft.com/previous-versions/ms535407(v=vs.85)">Image::Save</a> method of an <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nl-gdiplusheaders-image">Image</a> object.</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/nl-gdiplusimaging-imageitemdata
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ImageItemData extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Position {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    Desc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DescSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    Data {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Cookie {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
