#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct INSTALLLOGMODE {
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
    static INSTALLLOGMODE_FATALEXIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_WARNING => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_USER => 8

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_INFO => 16

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_RESOLVESOURCE => 64

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_OUTOFDISKSPACE => 128

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_ACTIONSTART => 256

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_ACTIONDATA => 512

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_COMMONDATA => 2048

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_PROPERTYDUMP => 1024

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_VERBOSE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_EXTRADEBUG => 8192

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_LOGONLYONERROR => 16384

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_LOGPERFORMANCE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_PROGRESS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_INITIALIZE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_TERMINATE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_SHOWDIALOG => 16384

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_FILESINUSE => 32

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_RMFILESINUSE => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_INSTALLSTART => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGMODE_INSTALLEND => 134217728
}
