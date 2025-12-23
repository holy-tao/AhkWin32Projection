#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the pixel format and size of a component plane.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmapplanedescription
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICBitmapPlaneDescription extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Describes the pixel format of the plane.
     * @type {Pointer<Guid>}
     */
    Format {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Component width of the plane.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Component height of the plane.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
