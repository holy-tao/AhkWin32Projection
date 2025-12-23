#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorNativeLinkFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static nlfNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static nlfLastError => 1

    /**
     * @type {Integer (Int32)}
     */
    static nlfNoMangle => 2

    /**
     * @type {Integer (Int32)}
     */
    static nlfMaxValue => 3
}
