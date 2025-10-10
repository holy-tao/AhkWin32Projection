#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HistogramBlobHeader structure describes the blob size and the number of histograms in the blob for the MF_CAPTURE_METADATA_HISTOGRAM attribute.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-histogramblobheader
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class HistogramBlobHeader extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size of the entire histogram blob in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of histograms in the blob. Each histogram is identified by a <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-histogramheader">HistogramHeader</a>.
     * @type {Integer}
     */
    Histograms {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
