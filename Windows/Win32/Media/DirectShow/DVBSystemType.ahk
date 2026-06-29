#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVBSystemType {
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
    static DVB_Cable => 0

    /**
     * @type {Integer (Int32)}
     */
    static DVB_Terrestrial => 1

    /**
     * @type {Integer (Int32)}
     */
    static DVB_Satellite => 2

    /**
     * @type {Integer (Int32)}
     */
    static ISDB_Terrestrial => 3

    /**
     * @type {Integer (Int32)}
     */
    static ISDB_Satellite => 4
}
