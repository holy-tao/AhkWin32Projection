#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_ADDREQ_FLAG extends Win32BitflagEnum {

    /**
     * Native name: HTTP_ADDREQ_FLAG_ADD
     * @type {Integer (UInt32)}
     */
    static ADD => 536870912

    /**
     * Native name: HTTP_ADDREQ_FLAG_ADD_IF_NEW
     * @type {Integer (UInt32)}
     */
    static ADD_IF_NEW => 268435456

    /**
     * Native name: HTTP_ADDREQ_FLAG_COALESCE
     * @type {Integer (UInt32)}
     */
    static COALESCE => 1073741824

    /**
     * Native name: HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA
     * @type {Integer (UInt32)}
     */
    static COALESCE_WITH_COMMA => 1073741824

    /**
     * Native name: HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON
     * @type {Integer (UInt32)}
     */
    static COALESCE_WITH_SEMICOLON => 16777216

    /**
     * Native name: HTTP_ADDREQ_FLAG_REPLACE
     * @type {Integer (UInt32)}
     */
    static REPLACE => 2147483648
}
