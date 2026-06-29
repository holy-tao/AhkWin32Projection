#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct EApiCategories {
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
    static eNoChecks => 0

    /**
     * @type {Integer (Int32)}
     */
    static eSynchronization => 1

    /**
     * @type {Integer (Int32)}
     */
    static eSharedState => 2

    /**
     * @type {Integer (Int32)}
     */
    static eExternalProcessMgmt => 4

    /**
     * @type {Integer (Int32)}
     */
    static eSelfAffectingProcessMgmt => 8

    /**
     * @type {Integer (Int32)}
     */
    static eExternalThreading => 16

    /**
     * @type {Integer (Int32)}
     */
    static eSelfAffectingThreading => 32

    /**
     * @type {Integer (Int32)}
     */
    static eSecurityInfrastructure => 64

    /**
     * @type {Integer (Int32)}
     */
    static eUI => 128

    /**
     * @type {Integer (Int32)}
     */
    static eMayLeakOnAbort => 256

    /**
     * @type {Integer (Int32)}
     */
    static eAll => 511
}
