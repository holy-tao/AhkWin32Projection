#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_INDEXER_TYPE enumeration type defines the types of indexing supported by the indexer.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_indexer_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_INDEXER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The indexer will construct an index using presentation times as indexes.
     * @type {Integer (Int32)}
     */
    static WMT_IT_PRESENTATION_TIME => 0

    /**
     * The indexer will construct an index using frame numbers as indexes.
     * @type {Integer (Int32)}
     */
    static WMT_IT_FRAME_NUMBERS => 1

    /**
     * The indexer will construct an index using SMPTE time codes as indexes.
     * @type {Integer (Int32)}
     */
    static WMT_IT_TIMECODE => 2
}
