#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PIDISR_INFO extends Win32Enum {

    /**
     * Native name: PIDISR_UP_TO_DATE
     * @type {Integer (Int32)}
     */
    static UP_TO_DATE => 0

    /**
     * Native name: PIDISR_NEEDS_ADD
     * @type {Integer (Int32)}
     */
    static NEEDS_ADD => 1

    /**
     * Native name: PIDISR_NEEDS_UPDATE
     * @type {Integer (Int32)}
     */
    static NEEDS_UPDATE => 2

    /**
     * Native name: PIDISR_NEEDS_DELETE
     * @type {Integer (Int32)}
     */
    static NEEDS_DELETE => 3
}
