#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WMT_INDEX_TYPE enumeration type defines the type of object that will be associated with an index.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ne-wmsdkidl-wmt_index_type
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_INDEX_TYPE{

    /**
     * The index will associate indexes with the nearest data unit, or packet, in the Windows Media file.
     * @type {Integer (Int32)}
     */
    static WMT_IT_NEAREST_DATA_UNIT => 1

    /**
     * The index will associate indexes with the nearest data object, or compressed sample, in the Windows Media file.
     * @type {Integer (Int32)}
     */
    static WMT_IT_NEAREST_OBJECT => 2

    /**
     * The index will associate indexes with the nearest <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">cleanpoint</a>, or video key frame, in the Windows Media file. This is the default index type.
     * @type {Integer (Int32)}
     */
    static WMT_IT_NEAREST_CLEAN_POINT => 3
}
