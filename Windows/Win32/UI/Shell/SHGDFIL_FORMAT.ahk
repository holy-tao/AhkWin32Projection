#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHGDFIL_FORMAT extends Win32Enum {

    /**
     * Native name: SHGDFIL_FINDDATA
     * @type {Integer (Int32)}
     */
    static FINDDATA => 1

    /**
     * Native name: SHGDFIL_NETRESOURCE
     * @type {Integer (Int32)}
     */
    static NETRESOURCE => 2

    /**
     * Native name: SHGDFIL_DESCRIPTIONID
     * @type {Integer (Int32)}
     */
    static DESCRIPTIONID => 3
}
