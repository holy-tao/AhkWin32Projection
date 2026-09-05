#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class CHANGEKIND extends Win32Enum {

    /**
     * Native name: CHANGEKIND_ADDMEMBER
     * @type {Integer (Int32)}
     */
    static ADDMEMBER => 0

    /**
     * Native name: CHANGEKIND_DELETEMEMBER
     * @type {Integer (Int32)}
     */
    static DELETEMEMBER => 1

    /**
     * Native name: CHANGEKIND_SETNAMES
     * @type {Integer (Int32)}
     */
    static SETNAMES => 2

    /**
     * Native name: CHANGEKIND_SETDOCUMENTATION
     * @type {Integer (Int32)}
     */
    static SETDOCUMENTATION => 3

    /**
     * Native name: CHANGEKIND_GENERAL
     * @type {Integer (Int32)}
     */
    static GENERAL => 4

    /**
     * Native name: CHANGEKIND_INVALIDATE
     * @type {Integer (Int32)}
     */
    static INVALIDATE => 5

    /**
     * Native name: CHANGEKIND_CHANGEFAILED
     * @type {Integer (Int32)}
     */
    static CHANGEFAILED => 6

    /**
     * Native name: CHANGEKIND_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 7
}
