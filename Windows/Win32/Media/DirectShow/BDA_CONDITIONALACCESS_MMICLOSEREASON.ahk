#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_CONDITIONALACCESS_MMICLOSEREASON extends Win32Enum {

    /**
     * Native name: CONDITIONALACCESS_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: CONDITIONALACCESS_CLOSED_ITSELF
     * @type {Integer (Int32)}
     */
    static CLOSED_ITSELF => 1

    /**
     * Native name: CONDITIONALACCESS_TUNER_REQUESTED_CLOSE
     * @type {Integer (Int32)}
     */
    static TUNER_REQUESTED_CLOSE => 2

    /**
     * Native name: CONDITIONALACCESS_DIALOG_TIMEOUT
     * @type {Integer (Int32)}
     */
    static DIALOG_TIMEOUT => 3

    /**
     * Native name: CONDITIONALACCESS_DIALOG_FOCUS_CHANGE
     * @type {Integer (Int32)}
     */
    static DIALOG_FOCUS_CHANGE => 4

    /**
     * Native name: CONDITIONALACCESS_DIALOG_USER_DISMISSED
     * @type {Integer (Int32)}
     */
    static DIALOG_USER_DISMISSED => 5

    /**
     * Native name: CONDITIONALACCESS_DIALOG_USER_NOT_AVAILABLE
     * @type {Integer (Int32)}
     */
    static DIALOG_USER_NOT_AVAILABLE => 6
}
