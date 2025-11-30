#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_INDEXER_TYPE enumeration type defines the types of indexing supported by the indexer.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_indexer_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_INDEXER_TYPE extends Win32Enum{

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
