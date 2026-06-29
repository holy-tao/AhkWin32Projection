#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_CONTEXT_TYPE enumeration type identifies the source of an MPEG-2 data stream.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ne-mpeg2structs-mpeg_context_type
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_CONTEXT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
