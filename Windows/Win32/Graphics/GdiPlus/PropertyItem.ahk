#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PropertyItem class is a helper class for the Image and Bitmap classes. A PropertyItem object holds one piece of image metadata.
 * @remarks
 * 
  * To set a property item (piece of metadata), pass the address of a <b>PropertyItem</b> object to the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-image-setpropertyitem">Image::SetPropertyItem</a> method of an 
  * 				<a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nl-gdiplusheaders-image">Image</a> object. To retrieve a property item, pass the address of a <b>PropertyItem</b> object to the <a href="https://docs.microsoft.com/windows/desktop/api/gdiplusheaders/nf-gdiplusheaders-image-getpropertyitem">Image::GetPropertyItem</a> method of an 
  * 				<b>Image</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusimaging/nl-gdiplusimaging-propertyitem
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PropertyItem extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    value {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
