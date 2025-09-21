#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_DVD_RENDERSTATUS structure contains codes indicating the status of DVD-Video playback. These codes are used in the IDvdGraphBuilder::RenderDvdVideoVolume method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-am_dvd_renderstatus
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVD_RENDERSTATUS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Overlay/VPE error code. Zero indicates success; any other value is failure.
     * @type {HRESULT}
     */
    hrVPEStatus {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <b>TRUE</b> if the specified DVD volume to be played does not exist; <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bDvdVolInvalid {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * <b>TRUE</b> if no DVD volume is specified or if it isn't found; <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bDvdVolUnknown {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * <b>TRUE</b> if the video decoder doesn't produce line 21 (closed captioning) data; <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bNoLine21In {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * <b>TRUE</b> if the video decoder can't be shown as closed captioning on video due to a problem with graph building; <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    bNoLine21Out {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Number of DVD streams to render.
     * @type {Integer}
     */
    iNumStreams {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Number of streams that failed to render.
     * @type {Integer}
     */
    iNumStreamsFailed {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Combination of [AM_DVD_STREAM_FLAGS](/windows/win32/api/strmif/ne-strmif-am_dvd_stream_flags) flags indicating which streams failed.
     * @type {Integer}
     */
    dwFailedStreamsFlag {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
