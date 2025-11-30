#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class CHANGEKIND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_ADDMEMBER => 0

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_DELETEMEMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_SETNAMES => 2

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_SETDOCUMENTATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_GENERAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_INVALIDATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_CHANGEFAILED => 6

    /**
     * @type {Integer (Int32)}
     */
    static CHANGEKIND_MAX => 7
}
