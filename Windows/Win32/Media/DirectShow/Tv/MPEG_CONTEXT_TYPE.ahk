#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * The MPEG_CONTEXT_TYPE enumeration type identifies the source of an MPEG-2 data stream.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ne-mpeg2structs-mpeg_context_type
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class MPEG_CONTEXT_TYPE extends Win32Enum {

    /**
     * Indicates that the source is a DirectShow filter graph using the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/mpeg-2-demultiplexer">MPEG-2 Demultiplexer</a> filter.
     * Native name: MPEG_CONTEXT_BCS_DEMUX
     * @type {Integer (Int32)}
     */
    static BCS_DEMUX => 0

    /**
     * Reserved. Do not use.
     * Native name: MPEG_CONTEXT_WINSOCK
     * @type {Integer (Int32)}
     */
    static WINSOCK => 1
}
