#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class PSUACTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static PSU_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static PSU_SECURITY_URL_ONLY => 2
}
