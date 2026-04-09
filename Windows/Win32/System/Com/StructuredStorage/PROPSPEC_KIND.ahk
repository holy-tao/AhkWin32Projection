#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
class PROPSPEC_KIND extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static PRSPEC_LPWSTR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRSPEC_PROPID => 1
}
