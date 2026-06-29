#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_CONDITIONALACCESS_SESSION_RESULT {
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
    static CONDITIONALACCESS_SUCCESSFULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ENDED_NOCHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ABORTED => 2
}
