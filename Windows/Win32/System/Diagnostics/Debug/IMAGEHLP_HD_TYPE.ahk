#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_HD_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static hdBase => 0

    /**
     * @type {Integer (Int32)}
     */
    static hdSym => 1

    /**
     * @type {Integer (Int32)}
     */
    static hdSrc => 2

    /**
     * @type {Integer (Int32)}
     */
    static hdMax => 3
}
