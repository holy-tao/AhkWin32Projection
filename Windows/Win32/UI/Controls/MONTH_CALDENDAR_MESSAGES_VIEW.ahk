#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MONTH_CALDENDAR_MESSAGES_VIEW extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_MONTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_YEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_DECADE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_CENTURY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MCMV_MAX => 3
}
