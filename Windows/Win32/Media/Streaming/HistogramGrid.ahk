#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The HistogramGrid structure describes the blob format for MF_CAPTURE_METADATA_HISTOGRAM.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-histogramgrid
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class HistogramGrid extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Width of the sensor output that histogram is collected from.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Height of the sensor output that histogram is collected from.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Absolute coordinates of the region on the sensor output that the histogram is collected for.
     * @type {RECT}
     */
    Region{
        get {
            if(!this.HasProp("__Region"))
                this.__Region := RECT(8, this)
            return this.__Region
        }
    }
}
