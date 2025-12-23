#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorRegFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static regNoCopy => 1

    /**
     * @type {Integer (Int32)}
     */
    static regConfig => 2

    /**
     * @type {Integer (Int32)}
     */
    static regHasRefs => 4
}
