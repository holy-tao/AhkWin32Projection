#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This topic applies to Windows XP Service Pack 2 only. The STREAMBUFFER_ATTRIBUTE structure contains performance data for the stream buffer filters.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ns-sbe-sbe_pin_data
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SBE_PIN_DATA {
    #StructPack 8

    /**
     * Total sample payload, in bytes.
     */
    cDataBytes : Int64

    /**
     * Number of samples processed.
     */
    cSamplesProcessed : Int64

    /**
     * Number of discontinuities. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-setdiscontinuity">IMediaSample::SetDiscontinuity</a>.
     */
    cDiscontinuities : Int64

    /**
     * Number of synchronization points. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-setsyncpoint">IMediaSample::SetSyncPoint</a>.
     */
    cSyncPoints : Int64

    /**
     * Number of time stamps.
     */
    cTimestamps : Int64

}
