#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible DVD video compression types.
 * @remarks
 * 
 * This enumeration is a member of the [DVD_VideoAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_videoattributes) structure, which is filled by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes">IDvdInfo2::GetCurrentVideoAttributes</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_video_compression
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_VIDEO_COMPRESSION{

    /**
     * Unrecognized compression type.
     * @type {Integer (Int32)}
     */
    static DVD_VideoCompression_Other => 0

    /**
     * MPEG-1 compression type.
     * @type {Integer (Int32)}
     */
    static DVD_VideoCompression_MPEG1 => 1

    /**
     * MPEG-2 compression type.
     * @type {Integer (Int32)}
     */
    static DVD_VideoCompression_MPEG2 => 2
}
