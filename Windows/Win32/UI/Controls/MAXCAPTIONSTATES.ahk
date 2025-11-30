#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MAXCAPTIONSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MXCS_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MXCS_INACTIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MXCS_DISABLED => 3
}
