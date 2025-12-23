#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PIDISR_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_UP_TO_DATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_NEEDS_ADD => 1

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_NEEDS_UPDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PIDISR_NEEDS_DELETE => 3
}
