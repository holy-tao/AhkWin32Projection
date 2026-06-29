#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSIPATCHSTATE {
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
    static MSIPATCHSTATE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_APPLIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_SUPERSEDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_OBSOLETED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_REGISTERED => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_ALL => 15
}
