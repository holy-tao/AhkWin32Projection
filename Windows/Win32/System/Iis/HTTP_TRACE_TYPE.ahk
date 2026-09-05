#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class HTTP_TRACE_TYPE extends Win32Enum {

    /**
     * Native name: HTTP_TRACE_TYPE_BYTE
     * @type {Integer (Int32)}
     */
    static BYTE => 17

    /**
     * Native name: HTTP_TRACE_TYPE_USHORT
     * @type {Integer (Int32)}
     */
    static USHORT => 18

    /**
     * Native name: HTTP_TRACE_TYPE_ULONG
     * @type {Integer (Int32)}
     */
    static ULONG => 19

    /**
     * Native name: HTTP_TRACE_TYPE_ULONGLONG
     * @type {Integer (Int32)}
     */
    static ULONGLONG => 21

    /**
     * Native name: HTTP_TRACE_TYPE_CHAR
     * @type {Integer (Int32)}
     */
    static CHAR => 16

    /**
     * Native name: HTTP_TRACE_TYPE_SHORT
     * @type {Integer (Int32)}
     */
    static SHORT => 2

    /**
     * Native name: HTTP_TRACE_TYPE_LONG
     * @type {Integer (Int32)}
     */
    static LONG => 3

    /**
     * Native name: HTTP_TRACE_TYPE_LONGLONG
     * @type {Integer (Int32)}
     */
    static LONGLONG => 20

    /**
     * Native name: HTTP_TRACE_TYPE_LPCWSTR
     * @type {Integer (Int32)}
     */
    static LPCWSTR => 31

    /**
     * Native name: HTTP_TRACE_TYPE_LPCSTR
     * @type {Integer (Int32)}
     */
    static LPCSTR => 30

    /**
     * Native name: HTTP_TRACE_TYPE_LPCGUID
     * @type {Integer (Int32)}
     */
    static LPCGUID => 72

    /**
     * Native name: HTTP_TRACE_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static BOOL => 11
}
