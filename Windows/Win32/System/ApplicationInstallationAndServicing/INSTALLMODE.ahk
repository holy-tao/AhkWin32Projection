#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct INSTALLMODE {
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
    static INSTALLMODE_NODETECTION_ANY => -4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NOSOURCERESOLUTION => -3

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_NODETECTION => -2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_EXISTING => -1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLMODE_DEFAULT => 0
}
