#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Cabinets
 */
export default struct FDINOTIFICATIONTYPE {
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
    static fdintCABINET_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static fdintPARTIAL_FILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static fdintCOPY_FILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static fdintCLOSE_FILE_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static fdintNEXT_CABINET => 4

    /**
     * @type {Integer (Int32)}
     */
    static fdintENUMERATE => 5
}
