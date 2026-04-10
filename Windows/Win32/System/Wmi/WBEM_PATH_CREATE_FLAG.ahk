#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_PATH_CREATE_FLAG extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_CREATE_ACCEPT_RELATIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_CREATE_ACCEPT_ABSOLUTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_CREATE_ACCEPT_ALL => 4

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_TREAT_SINGLE_IDENT_AS_NS => 8
}
