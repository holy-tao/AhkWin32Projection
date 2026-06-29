#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMT_ATTR_DATATYPE enumeration defines the data type for a variably typed property.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_ATTR_DATATYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The property is a 4-byte <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_DWORD => 0

    /**
     * The property is a null-terminated Unicode string.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_STRING => 1

    /**
     * The property is an array of bytes.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_BINARY => 2

    /**
     * The property is a 4-byte Boolean value.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_BOOL => 3

    /**
     * The property is an 8-byte <b>QWORD</b> value.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_QWORD => 4

    /**
     * The property is a 2-byte <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_WORD => 5

    /**
     * The property is a 128-bit (6-byte) GUID.
     * @type {Integer (Int32)}
     */
    static WMT_TYPE_GUID => 6
}
