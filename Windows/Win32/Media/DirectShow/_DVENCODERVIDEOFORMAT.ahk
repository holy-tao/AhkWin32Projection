#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the video standard (NTSC or PAL) for digital video (DV) encoding.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_dvencodervideoformat
 * @namespace Windows.Win32.Media.DirectShow
 */
class _DVENCODERVIDEOFORMAT extends Win32Enum {

    /**
     * National Television Standards Committee (NTSC)
     * Native name: DVENCODERVIDEOFORMAT_NTSC
     * @type {Integer (Int32)}
     */
    static NTSC => 2000

    /**
     * Phase Alternating Line (PAL)
     * Native name: DVENCODERVIDEOFORMAT_PAL
     * @type {Integer (Int32)}
     */
    static PAL => 2001
}
