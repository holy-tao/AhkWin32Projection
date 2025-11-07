#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\HistogramGrid.ahk

/**
 * The HistogramHeader structure describes the blob format for MF_CAPTURE_METADATA_HISTOGRAM.
 * @remarks
 * 
 * The <b>MF_CAPTURE_METADATA_HISTOGRAM</b> attribute contains a  histogram when a preview frame is captured.
 * 
 * For the <b>ChannelMasks</b> field, the following bitmasks indicate the available channels in the histogram:
 * 
 * 
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-histogramheader
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class HistogramHeader extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of this header + (<a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-histogramdataheader">HistogramDataHeader</a> + histogram data following) * number of channels available.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of bins in the histogram.
     * @type {Integer}
     */
    Bins {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Color space that the histogram is collected from
     * @type {Integer}
     */
    FourCC {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Masks of the color channels that the histogram is collected for.
     * @type {Integer}
     */
    ChannelMasks {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Grid that the histogram is collected from.
     * @type {HistogramGrid}
     */
    Grid{
        get {
            if(!this.HasProp("__Grid"))
                this.__Grid := HistogramGrid(16, this)
            return this.__Grid
        }
    }
}
