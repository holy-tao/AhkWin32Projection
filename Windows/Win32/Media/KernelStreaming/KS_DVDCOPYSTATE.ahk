#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_DVDCOPYSTATE {
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
    static KS_DVDCOPYSTATE_INITIALIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_INITIALIZE_TITLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_AUTHENTICATION_REQUIRED => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_DONE => 4
}
