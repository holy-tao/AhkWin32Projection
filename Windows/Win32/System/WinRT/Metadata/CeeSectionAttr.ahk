#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CeeSectionAttr extends Win32Enum{

    /**
     * @type {Integer (Int64)}
     */
    static sdNone => 0

    /**
     * @type {Integer (Int64)}
     */
    static sdReadOnly => 1073741888

    /**
     * @type {Integer (Int64)}
     */
    static sdReadWrite => 3221225536

    /**
     * @type {Integer (Int64)}
     */
    static sdExecute => 1610612768
}
