#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDCOLORKEY structure describes a source color key, destination color key, or color space.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddcolorkey
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDCOLORKEY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Low value of the color range that is to be used as the color key.
     * @type {Integer}
     */
    dwColorSpaceLowValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * High value of the color range that is to be used as the color key.
     * @type {Integer}
     */
    dwColorSpaceHighValue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
