#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_CONDITIONALACCESS_MMICLOSEREASON{

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_CLOSED_ITSELF => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_TUNER_REQUESTED_CLOSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_DIALOG_TIMEOUT => 3

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_DIALOG_FOCUS_CHANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_DIALOG_USER_DISMISSED => 5

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_DIALOG_USER_NOT_AVAILABLE => 6
}
