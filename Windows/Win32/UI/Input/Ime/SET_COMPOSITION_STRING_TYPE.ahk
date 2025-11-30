#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class SET_COMPOSITION_STRING_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_SETSTR => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CHANGEATTR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_CHANGECLAUSE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_SETRECONVERTSTRING => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SCS_QUERYRECONVERTSTRING => 131072
}
