#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Don't use this structure; it is not supported and it will be removed from the header in a future release.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_display_color_space
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_DISPLAY_COLOR_SPACE extends Win32Struct
{
    static sizeof => 192

    static packingSize => 4

    /**
     * The primary coordinates, as an 8 by 2 array of FLOAT values.
     * @type {Array<Single>}
     */
    PrimaryCoordinates{
        get {
            if(!this.HasProp("__PrimaryCoordinatesProxyArray"))
                this.__PrimaryCoordinatesProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "float")
            return this.__PrimaryCoordinatesProxyArray
        }
    }

    /**
     * The white points, as a 16 by 2 array of FLOAT values.
     * @type {Array<Single>}
     */
    WhitePoints{
        get {
            if(!this.HasProp("__WhitePointsProxyArray"))
                this.__WhitePointsProxyArray := Win32FixedArray(this.ptr + 64, 4, Primitive, "float")
            return this.__WhitePointsProxyArray
        }
    }
}
