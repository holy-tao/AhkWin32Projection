#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct INSTALLSTATE {
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
    static INSTALLSTATE_NOTUSED => -7

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_BADCONFIG => -6

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_INCOMPLETE => -5

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_SOURCEABSENT => -4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_MOREDATA => -3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_INVALIDARG => -2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_BROKEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_ADVERTISED => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_REMOVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_ABSENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_LOCAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_SOURCE => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLSTATE_DEFAULT => 5
}
