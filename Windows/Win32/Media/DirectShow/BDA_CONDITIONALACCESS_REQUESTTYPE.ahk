#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_CONDITIONALACCESS_REQUESTTYPE {
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
    static CONDITIONALACCESS_ACCESS_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_NOT_POSSIBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_POSSIBLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static CONDITIONALACCESS_ACCESS_POSSIBLE_NO_STREAMING_DISRUPTION => 3
}
