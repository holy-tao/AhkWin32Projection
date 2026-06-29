#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAXROUTE_ENABLE {
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
    static QUERY_STATUS => -1

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static STATUS_ENABLE => 1
}
