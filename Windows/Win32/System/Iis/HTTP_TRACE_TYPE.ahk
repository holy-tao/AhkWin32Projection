#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class HTTP_TRACE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_BYTE => 17

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_USHORT => 18

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_ULONG => 19

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_ULONGLONG => 21

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_CHAR => 16

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_SHORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LONG => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LONGLONG => 20

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LPCWSTR => 31

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LPCSTR => 30

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LPCGUID => 72

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_BOOL => 11
}
