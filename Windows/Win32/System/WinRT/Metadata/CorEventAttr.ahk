#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorEventAttr extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static evSpecialName => 512

    /**
     * @type {Integer (Int32)}
     */
    static evReservedMask => 1024

    /**
     * @type {Integer (Int32)}
     */
    static evRTSpecialName => 1024
}
