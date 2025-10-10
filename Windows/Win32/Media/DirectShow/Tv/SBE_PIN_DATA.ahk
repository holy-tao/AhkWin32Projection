#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * This topic applies to Windows XP Service Pack 2 only. The STREAMBUFFER_ATTRIBUTE structure contains performance data for the stream buffer filters.
 * @see https://docs.microsoft.com/windows/win32/api//sbe/ns-sbe-sbe_pin_data
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SBE_PIN_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Total sample payload, in bytes.
     * @type {Integer}
     */
    cDataBytes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of samples processed.
     * @type {Integer}
     */
    cSamplesProcessed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of discontinuities. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-setdiscontinuity">IMediaSample::SetDiscontinuity</a>.
     * @type {Integer}
     */
    cDiscontinuities {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of synchronization points. See <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediasample-setsyncpoint">IMediaSample::SetSyncPoint</a>.
     * @type {Integer}
     */
    cSyncPoints {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Number of time stamps.
     * @type {Integer}
     */
    cTimestamps {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
