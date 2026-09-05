#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMT_ATTR_DATATYPE enumeration defines the data type for a variably typed property.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
class WMT_ATTR_DATATYPE extends Win32Enum {

    /**
     * The property is a 4-byte <b>DWORD</b> value.
     * Native name: WMT_TYPE_DWORD
     * @type {Integer (Int32)}
     */
    static TYPE_DWORD => 0

    /**
     * The property is a null-terminated Unicode string.
     * Native name: WMT_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static TYPE_STRING => 1

    /**
     * The property is an array of bytes.
     * Native name: WMT_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static TYPE_BINARY => 2

    /**
     * The property is a 4-byte Boolean value.
     * Native name: WMT_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static TYPE_BOOL => 3

    /**
     * The property is an 8-byte <b>QWORD</b> value.
     * Native name: WMT_TYPE_QWORD
     * @type {Integer (Int32)}
     */
    static TYPE_QWORD => 4

    /**
     * The property is a 2-byte <b>WORD</b> value.
     * Native name: WMT_TYPE_WORD
     * @type {Integer (Int32)}
     */
    static TYPE_WORD => 5

    /**
     * The property is a 128-bit (6-byte) GUID.
     * Native name: WMT_TYPE_GUID
     * @type {Integer (Int32)}
     */
    static TYPE_GUID => 6
}
