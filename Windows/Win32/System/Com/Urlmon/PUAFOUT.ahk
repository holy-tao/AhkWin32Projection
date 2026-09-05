#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class PUAFOUT extends Win32Enum {

    /**
     * Native name: PUAFOUT_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: PUAFOUT_ISLOCKZONEPOLICY
     * @type {Integer (Int32)}
     */
    static ISLOCKZONEPOLICY => 1
}
