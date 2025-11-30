#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class APPX_PACKAGING_CONTEXT_CHANGE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGING_CONTEXT_CHANGE_TYPE_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGING_CONTEXT_CHANGE_TYPE_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGING_CONTEXT_CHANGE_TYPE_DETAILS => 2

    /**
     * @type {Integer (Int32)}
     */
    static APPX_PACKAGING_CONTEXT_CHANGE_TYPE_END => 3
}
