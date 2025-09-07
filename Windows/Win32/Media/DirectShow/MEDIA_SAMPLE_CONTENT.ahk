#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the contents of an elementary stream within an MPEG-2 transport stream. This enumeration is used in the IMPEG2PIDMap interface, which is implemented on the output pins of the MPEG-2 Demultiplexer.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/media-sample-content
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MEDIA_SAMPLE_CONTENT{

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
