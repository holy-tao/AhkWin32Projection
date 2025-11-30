#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class SZM_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SZM_CREATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SZM_DELETE => 1
}
