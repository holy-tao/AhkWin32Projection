#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct CREATESUBSCRIPTIONFLAGS {
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
    static CREATESUBS_ADDTOFAVORITES => 1

    /**
     * @type {Integer (Int32)}
     */
    static CREATESUBS_FROMFAVORITES => 2

    /**
     * @type {Integer (Int32)}
     */
    static CREATESUBS_NOUI => 4

    /**
     * @type {Integer (Int32)}
     */
    static CREATESUBS_NOSAVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static CREATESUBS_SOFTWAREUPDATE => 16
}
