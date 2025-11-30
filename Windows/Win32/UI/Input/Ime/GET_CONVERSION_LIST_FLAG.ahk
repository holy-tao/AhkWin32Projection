#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class GET_CONVERSION_LIST_FLAG extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static GCL_CONVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GCL_REVERSECONVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GCL_REVERSE_LENGTH => 3
}
