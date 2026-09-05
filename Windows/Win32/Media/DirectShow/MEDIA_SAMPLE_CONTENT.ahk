#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the contents of an elementary stream within an MPEG-2 transport stream. This enumeration is used in the IMPEG2PIDMap interface, which is implemented on the output pins of the MPEG-2 Demultiplexer.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/media-sample-content
 * @namespace Windows.Win32.Media.DirectShow
 */
class MEDIA_SAMPLE_CONTENT extends Win32Enum {

    /**
     * Native name: MEDIA_TRANSPORT_PACKET
     * @type {Integer (Int32)}
     */
    static TRANSPORT_PACKET => 0

    /**
     * Native name: MEDIA_ELEMENTARY_STREAM
     * @type {Integer (Int32)}
     */
    static ELEMENTARY_STREAM => 1

    /**
     * Native name: MEDIA_MPEG2_PSI
     * @type {Integer (Int32)}
     */
    static MPEG2_PSI => 2

    /**
     * Native name: MEDIA_TRANSPORT_PAYLOAD
     * @type {Integer (Int32)}
     */
    static TRANSPORT_PAYLOAD => 3
}
