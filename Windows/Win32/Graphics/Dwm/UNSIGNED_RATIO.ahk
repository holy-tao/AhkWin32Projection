#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a data type used by the Desktop Window Manager (DWM) APIs. It represents a generic ratio and is used for different purposes and units even within a single API.
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ns-dwmapi-unsigned_ratio
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class UNSIGNED_RATIO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The ratio numerator.
     * @type {Integer}
     */
    uiNumerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The ratio denominator.
     * @type {Integer}
     */
    uiDenominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
