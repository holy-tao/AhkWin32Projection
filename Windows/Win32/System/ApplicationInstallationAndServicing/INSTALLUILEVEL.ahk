#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct INSTALLUILEVEL {
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
    static INSTALLUILEVEL_NOCHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_NONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_BASIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_REDUCED => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_FULL => 5

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_ENDDIALOG => 128

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_PROGRESSONLY => 64

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_HIDECANCEL => 32

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_SOURCERESONLY => 256

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLUILEVEL_UACONLY => 512
}
