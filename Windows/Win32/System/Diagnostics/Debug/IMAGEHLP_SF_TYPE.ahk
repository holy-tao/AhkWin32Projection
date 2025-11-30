#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_SF_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static sfImage => 0

    /**
     * @type {Integer (Int32)}
     */
    static sfDbg => 1

    /**
     * @type {Integer (Int32)}
     */
    static sfPdb => 2

    /**
     * @type {Integer (Int32)}
     */
    static sfMpd => 3

    /**
     * @type {Integer (Int32)}
     */
    static sfMax => 4
}
