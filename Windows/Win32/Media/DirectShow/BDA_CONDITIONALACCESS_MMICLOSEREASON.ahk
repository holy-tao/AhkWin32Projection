#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_CONDITIONALACCESS_MMICLOSEREASON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
