#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_GET_TYPE_INFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_GET_TYPE_INFO_CHILDREN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_GET_TYPE_INFO_UNCACHED => 1
}
