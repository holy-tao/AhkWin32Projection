#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct INSTALLFEATUREATTRIBUTE {
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
    static INSTALLFEATUREATTRIBUTE_FAVORLOCAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLFEATUREATTRIBUTE_FAVORSOURCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLFEATUREATTRIBUTE_FOLLOWPARENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLFEATUREATTRIBUTE_FAVORADVERTISE => 8

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE => 16

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE => 32
}
