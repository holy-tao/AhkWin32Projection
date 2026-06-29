#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HistogramGrid.ahk" { HistogramGrid }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The HistogramHeader structure describes the blob format for MF_CAPTURE_METADATA_HISTOGRAM.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_HISTOGRAM</b> attribute contains a  histogram when a preview frame is captured.
 * 
 * For the <b>ChannelMasks</b> field, the following bitmasks indicate the available channels in the histogram:
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-histogramheader
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct HistogramHeader {
    #StructPack 4

    /**
     * Size of this header + (<a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-histogramdataheader">HistogramDataHeader</a> + histogram data following) * number of channels available.
     */
    Size : UInt32

    /**
     * Number of bins in the histogram.
     */
    Bins : UInt32

    /**
     * Color space that the histogram is collected from
     */
    FourCC : UInt32

    /**
     * Masks of the color channels that the histogram is collected for.
     */
    ChannelMasks : UInt32

    /**
     * Grid that the histogram is collected from.
     */
    Grid : HistogramGrid

}
