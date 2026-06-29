#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct SCRIPTFLAGS {
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
    static SCRIPTFLAGS_CACHEINFO => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_SHORTCUTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_MACHINEASSIGN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_CNFGINFO => 32

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST => 64

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_CLASSINFO => 128

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_EXTENSIONINFO => 256

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA_APPINFO => 384

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTFLAGS_REGDATA => 416
}
