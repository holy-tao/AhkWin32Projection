#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies the pixel format and size of a component plane.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmapplanedescription
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICBitmapPlaneDescription extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * Describes the pixel format of the plane.
     * @type {Guid}
     */
    Format {
        get {
            if(!this.HasProp("__Format"))
                this.__Format := Guid(0, this)
            return this.__Format
        }
    }

    /**
     * Component width of the plane.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Component height of the plane.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
