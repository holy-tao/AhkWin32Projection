#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a raw image tone curve point.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ns-wincodec-wicrawtonecurvepoint
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRawToneCurvePoint extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>double</b>
     * 
     * The tone curve input.
     * @type {Float}
     */
    Input {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>double</b>
     * 
     * The tone curve output.
     * @type {Float}
     */
    Output {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
