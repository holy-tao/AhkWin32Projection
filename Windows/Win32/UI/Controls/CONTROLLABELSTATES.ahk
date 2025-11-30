#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class CONTROLLABELSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TS_CONTROLLABEL_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TS_CONTROLLABEL_DISABLED => 2
}
