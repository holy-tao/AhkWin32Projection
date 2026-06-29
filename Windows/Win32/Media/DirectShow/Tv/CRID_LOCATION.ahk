#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct CRID_LOCATION {
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
    static CRID_LOCATION_IN_DESCRIPTOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static CRID_LOCATION_IN_CIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static CRID_LOCATION_DVB_RESERVED1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CRID_LOCATION_DVB_RESERVED2 => 3
}
