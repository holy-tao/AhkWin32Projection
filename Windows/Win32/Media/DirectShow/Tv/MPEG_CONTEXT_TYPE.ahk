#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MPEG_CONTEXT_TYPE enumeration type identifies the source of an MPEG-2 data stream.
 * @see https://docs.microsoft.com/windows/win32/api//mpeg2structs/ne-mpeg2structs-mpeg_context_type
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_CONTEXT_TYPE{

    /**
     * Indicates that the source is a DirectShow filter graph using the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-2-demultiplexer">MPEG-2 Demultiplexer</a> filter.
     * @type {Integer (Int32)}
     */
    static MPEG_CONTEXT_BCS_DEMUX => 0

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static MPEG_CONTEXT_WINSOCK => 1
}
