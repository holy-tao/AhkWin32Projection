#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class APPX_PACKAGING_CONTEXT_CHANGE_TYPE extends Win32Enum {

    /**
     * Native name: APPX_PACKAGING_CONTEXT_CHANGE_TYPE_START
     * @type {Integer (Int32)}
     */
    static START => 0

    /**
     * Native name: APPX_PACKAGING_CONTEXT_CHANGE_TYPE_CHANGE
     * @type {Integer (Int32)}
     */
    static CHANGE => 1

    /**
     * Native name: APPX_PACKAGING_CONTEXT_CHANGE_TYPE_DETAILS
     * @type {Integer (Int32)}
     */
    static DETAILS => 2

    /**
     * Native name: APPX_PACKAGING_CONTEXT_CHANGE_TYPE_END
     * @type {Integer (Int32)}
     */
    static END => 3
}
