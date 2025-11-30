#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/DirectShow/media-sample-content
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MEDIA_SAMPLE_CONTENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_TRANSPORT_PACKET => 0

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_ELEMENTARY_STREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_MPEG2_PSI => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_TRANSPORT_PAYLOAD => 3
}
