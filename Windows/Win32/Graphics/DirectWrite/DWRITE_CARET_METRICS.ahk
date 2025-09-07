#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_CARET_METRICS structure specifies the metrics for caret placement in a font.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_caret_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_CARET_METRICS extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Vertical rise of the caret in font design units. Rise / Run yields the caret angle. Rise = 1 for perfectly upright fonts (non-italic).
     * @type {Integer}
     */
    slopeRise {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Horizontal run of the caret in font design units. Rise / Run yields the caret angle. Run = 0 for perfectly upright fonts (non-italic).
     * @type {Integer}
     */
    slopeRun {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * Horizontal offset of the caret, in font design units, along the baseline for good appearance. Offset = 0 for perfectly upright fonts (non-italic).
     * @type {Integer}
     */
    offset {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }
}
