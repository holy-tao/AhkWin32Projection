#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorPropertyAttr extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static prSpecialName => 512

    /**
     * @type {Integer (Int32)}
     */
    static prReservedMask => 62464

    /**
     * @type {Integer (Int32)}
     */
    static prRTSpecialName => 1024

    /**
     * @type {Integer (Int32)}
     */
    static prHasDefault => 4096

    /**
     * @type {Integer (Int32)}
     */
    static prUnused => 59903
}
