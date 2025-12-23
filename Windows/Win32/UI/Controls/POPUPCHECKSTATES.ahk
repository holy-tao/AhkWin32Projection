#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class POPUPCHECKSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MC_CHECKMARKNORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MC_CHECKMARKDISABLED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MC_BULLETNORMAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static MC_BULLETDISABLED => 4
}
