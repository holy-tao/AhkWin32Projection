#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASAPIVERSION {
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
    static RASAPIVERSION_500 => 1

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_501 => 2

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_600 => 3

    /**
     * @type {Integer (Int32)}
     */
    static RASAPIVERSION_601 => 4
}
