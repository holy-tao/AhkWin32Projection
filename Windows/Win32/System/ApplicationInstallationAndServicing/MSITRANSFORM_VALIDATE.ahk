#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSITRANSFORM_VALIDATE {
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
    static MSITRANSFORM_VALIDATE_LANGUAGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_PRODUCT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_PLATFORM => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_MAJORVERSION => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_MINORVERSION => 16

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_UPDATEVERSION => 32

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_NEWLESSBASEVERSION => 64

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_NEWLESSEQUALBASEVERSION => 128

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_NEWEQUALBASEVERSION => 256

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_NEWGREATEREQUALBASEVERSION => 512

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_NEWGREATERBASEVERSION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static MSITRANSFORM_VALIDATE_UPGRADECODE => 2048
}
