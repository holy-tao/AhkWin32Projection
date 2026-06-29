#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HistogramBlobHeader structure describes the blob size and the number of histograms in the blob for the MF_CAPTURE_METADATA_HISTOGRAM attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-histogramblobheader
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct HistogramBlobHeader {
    #StructPack 4

    /**
     * Size of the entire histogram blob in bytes.
     */
    Size : UInt32

    /**
     * Number of histograms in the blob. Each histogram is identified by a <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-histogramheader">HistogramHeader</a>.
     */
    Histograms : UInt32

}
