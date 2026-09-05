#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible DVD video compression types.
 * @remarks
 * This enumeration is a member of the [DVD_VideoAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_videoattributes) structure, which is filled by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes">IDvdInfo2::GetCurrentVideoAttributes</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_video_compression
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_VIDEO_COMPRESSION extends Win32Enum {

    /**
     * Unrecognized compression type.
     * Native name: DVD_VideoCompression_Other
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * MPEG-1 compression type.
     * Native name: DVD_VideoCompression_MPEG1
     * @type {Integer (Int32)}
     */
    static MPEG1 => 1

    /**
     * MPEG-2 compression type.
     * Native name: DVD_VideoCompression_MPEG2
     * @type {Integer (Int32)}
     */
    static MPEG2 => 2
}
