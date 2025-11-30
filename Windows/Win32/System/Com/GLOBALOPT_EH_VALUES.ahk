#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class GLOBALOPT_EH_VALUES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_HANDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_DONOT_HANDLE_FATAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_DONOT_HANDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMGLB_EXCEPTION_DONOT_HANDLE_ANY => 2
}
