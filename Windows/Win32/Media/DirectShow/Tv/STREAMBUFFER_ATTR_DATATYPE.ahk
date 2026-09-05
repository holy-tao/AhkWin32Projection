#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * This topic applies only to Windows XP Service Pack 1 or later.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/ne-sbe-streambuffer_attr_datatype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class STREAMBUFFER_ATTR_DATATYPE extends Win32Enum {

    /**
     * The attribute is a 32-bit <b>DWORD</b> value.
     * Native name: STREAMBUFFER_TYPE_DWORD
     * @type {Integer (Int32)}
     */
    static TYPE_DWORD => 0

    /**
     * The attribute is a null-terminated wide-character string.
     * Native name: STREAMBUFFER_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static TYPE_STRING => 1

    /**
     * The attribute is an array of bytes.
     * Native name: STREAMBUFFER_TYPE_BINARY
     * @type {Integer (Int32)}
     */
    static TYPE_BINARY => 2

    /**
     * The attribute is a 32-bit Boolean value.
     * Native name: STREAMBUFFER_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static TYPE_BOOL => 3

    /**
     * The attribute is a 64-bit <b>QWORD</b> value.
     * Native name: STREAMBUFFER_TYPE_QWORD
     * @type {Integer (Int32)}
     */
    static TYPE_QWORD => 4

    /**
     * The attribute is a 16-bit <b>WORD</b> value.
     * Native name: STREAMBUFFER_TYPE_WORD
     * @type {Integer (Int32)}
     */
    static TYPE_WORD => 5

    /**
     * The attribute is a 128-bit <b>GUID</b> value.
     * Native name: STREAMBUFFER_TYPE_GUID
     * @type {Integer (Int32)}
     */
    static TYPE_GUID => 6
}
