#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Credentials
 */
export default struct READER_SEL_REQUEST_MATCH_TYPE {
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
    static RSR_MATCH_TYPE_READER_AND_CONTAINER => 1

    /**
     * @type {Integer (Int32)}
     */
    static RSR_MATCH_TYPE_SERIAL_NUMBER => 2

    /**
     * @type {Integer (Int32)}
     */
    static RSR_MATCH_TYPE_ALL_CARDS => 3
}
