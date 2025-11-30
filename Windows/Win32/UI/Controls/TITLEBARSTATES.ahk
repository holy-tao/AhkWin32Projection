#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TITLEBARSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AW_S_TITLEBAR_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AW_S_TITLEBAR_INACTIVE => 2
}
