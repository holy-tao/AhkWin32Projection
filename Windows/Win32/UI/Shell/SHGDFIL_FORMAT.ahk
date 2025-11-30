#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHGDFIL_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SHGDFIL_FINDDATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static SHGDFIL_NETRESOURCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SHGDFIL_DESCRIPTIONID => 3
}
