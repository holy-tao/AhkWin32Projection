#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/gdi/colorref
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class COLORREF extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    static GetRed(color) => color & 0xFF
    static GetGreen(color) => (color >> 8) & 0xFF
    static GetBlue(color) => (color >> 16) & 0xFF
    
    static SetRed(color, value) => (color & 0xFFFFFF00) | value 
    static SetGreen(color, value) => (color & 0xFFFF00FF) | (value << 8)
    static SetBlue(color, value) => (color & 0xFF00FFFF) | (value << 16)
    
    /**
     * Converts a GBR COLORREF to an RGB hex string
     *
     * @param {Integer} the color to convert
     * @returns {String} the RGB string
     */
    static ToRGBString(color){
        return Format("0x{1:02X}{2:02X}{3:02X}", 
            COLORREF.GetRed(color), 
            COLORREF.GetGreen(color), 
            COLORREF.GetBlue(color))
    }
    
    red {
        get => COLORREF.GetRed(this.value)
        set => this.value := COLORREF.SetRed(this.value, value)
    }
    green {
        get => COLORREF.GetGreen(this.value)
        set => this.value := COLORREF.SetGreen(this.value, value)
    }
    blue {
        get => COLORREF.GetBlue(this.value)
        set => this.value := COLORREF.SetBlue(this.value, value)
    }
    
    /**
     * Converts the COLORREF from its default format (GBR) to an AHK-compatible
     * RGB hex string
     *
     * @returns {String} the RGB string
     */
    ToRGBString() => COLORREF.ToRGBString(this.value)
}
