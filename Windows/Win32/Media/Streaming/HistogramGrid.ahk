#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The HistogramGrid structure describes the blob format for MF_CAPTURE_METADATA_HISTOGRAM.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-histogramgrid
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct HistogramGrid {
    #StructPack 4

    /**
     * Width of the sensor output that histogram is collected from.
     */
    Width : UInt32

    /**
     * Height of the sensor output that histogram is collected from.
     */
    Height : UInt32

    /**
     * Absolute coordinates of the region on the sensor output that the histogram is collected for.
     */
    Region : RECT

}
