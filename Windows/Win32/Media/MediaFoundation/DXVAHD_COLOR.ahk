#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVAHD_COLOR_RGBA.ahk
#Include .\DXVAHD_COLOR_YCbCrA.ahk

/**
 * Defines a color value for DXVA-HD.
 * @remarks
 * 
 * This union can represent both RGB and YCbCr colors. The interpretation of the union depends on the context.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_color
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_COLOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A [DXVAHD_COLOR_RGBA](./ns-dxvahd-dxvahd_color_rgba.md) structure that contains an RGB color value.
     * @type {DXVAHD_COLOR_RGBA}
     */
    RGB{
        get {
            if(!this.HasProp("__RGB"))
                this.__RGB := DXVAHD_COLOR_RGBA(0, this)
            return this.__RGB
        }
    }

    /**
     * A [DXVAHD_COLOR_YCbCrA](./ns-dxvahd-dxvahd_color_ycbcra.md) structure that contains a YCbCr color value.
     * @type {DXVAHD_COLOR_YCbCrA}
     */
    YCbCr{
        get {
            if(!this.HasProp("__YCbCr"))
                this.__YCbCr := DXVAHD_COLOR_YCbCrA(0, this)
            return this.__YCbCr
        }
    }
}
