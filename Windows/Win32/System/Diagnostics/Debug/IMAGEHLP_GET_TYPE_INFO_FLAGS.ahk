#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGEHLP_GET_TYPE_INFO_FLAGS extends Win32Enum {

    /**
     * Native name: IMAGEHLP_GET_TYPE_INFO_CHILDREN
     * @type {Integer (UInt32)}
     */
    static CHILDREN => 2

    /**
     * Native name: IMAGEHLP_GET_TYPE_INFO_UNCACHED
     * @type {Integer (UInt32)}
     */
    static UNCACHED => 1
}
