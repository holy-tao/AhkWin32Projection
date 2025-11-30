#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the video standard (NTSC or PAL) for digital video (DV) encoding.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-_dvencodervideoformat
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class _DVENCODERVIDEOFORMAT extends Win32Enum{

    /**
     * National Television Standards Committee (NTSC)
     * @type {Integer (Int32)}
     */
    static DVENCODERVIDEOFORMAT_NTSC => 2000

    /**
     * Phase Alternating Line (PAL)
     * @type {Integer (Int32)}
     */
    static DVENCODERVIDEOFORMAT_PAL => 2001
}
