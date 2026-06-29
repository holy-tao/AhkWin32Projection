#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The AM_DVD_RENDERSTATUS structure contains codes indicating the status of DVD-Video playback. These codes are used in the IDvdGraphBuilder::RenderDvdVideoVolume method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-am_dvd_renderstatus
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVD_RENDERSTATUS {
    #StructPack 4

    /**
     * Overlay/VPE error code. Zero indicates success; any other value is failure.
     */
    hrVPEStatus : HRESULT

    /**
     * <b>TRUE</b> if the specified DVD volume to be played does not exist; <b>FALSE</b> otherwise.
     */
    bDvdVolInvalid : BOOL

    /**
     * <b>TRUE</b> if no DVD volume is specified or if it isn't found; <b>FALSE</b> otherwise.
     */
    bDvdVolUnknown : BOOL

    /**
     * <b>TRUE</b> if the video decoder doesn't produce line 21 (closed captioning) data; <b>FALSE</b> otherwise.
     */
    bNoLine21In : BOOL

    /**
     * <b>TRUE</b> if the video decoder can't be shown as closed captioning on video due to a problem with graph building; <b>FALSE</b> otherwise.
     */
    bNoLine21Out : BOOL

    /**
     * Number of DVD streams to render.
     */
    iNumStreams : Int32

    /**
     * Number of streams that failed to render.
     */
    iNumStreamsFailed : Int32

    /**
     * Combination of [AM_DVD_STREAM_FLAGS](/windows/win32/api/strmif/ne-strmif-am_dvd_stream_flags) flags indicating which streams failed.
     */
    dwFailedStreamsFlag : UInt32

}
