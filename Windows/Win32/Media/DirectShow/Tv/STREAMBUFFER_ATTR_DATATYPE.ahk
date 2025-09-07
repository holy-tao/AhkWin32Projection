#Requires AutoHotkey v2.0.0 64-bit

/**
 * This topic applies only to Windows XP Service Pack 1 or later.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ne-sbe-streambuffer_attr_datatype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class STREAMBUFFER_ATTR_DATATYPE{

    /**
     * The attribute is a 32-bit <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_DWORD => 0

    /**
     * The attribute is a null-terminated wide-character string.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_STRING => 1

    /**
     * The attribute is an array of bytes.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_BINARY => 2

    /**
     * The attribute is a 32-bit Boolean value.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_BOOL => 3

    /**
     * The attribute is a 64-bit <b>QWORD</b> value.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_QWORD => 4

    /**
     * The attribute is a 16-bit <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_WORD => 5

    /**
     * The attribute is a 128-bit <b>GUID</b> value.
     * @type {Integer (Int32)}
     */
    static STREAMBUFFER_TYPE_GUID => 6
}
