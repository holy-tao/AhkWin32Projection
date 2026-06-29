#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct BSCF {
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
    static BSCF_FIRSTDATANOTIFICATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_INTERMEDIATEDATANOTIFICATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_LASTDATANOTIFICATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_DATAFULLYAVAILABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_AVAILABLEDATASIZEUNKNOWN => 16

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_SKIPDRAINDATAFORFILEURLS => 32

    /**
     * @type {Integer (Int32)}
     */
    static BSCF_64BITLENGTHDOWNLOAD => 64
}
