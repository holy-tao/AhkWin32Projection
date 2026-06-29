#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct EClrOperation {
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
    static OPR_ThreadAbort => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ThreadRudeAbortInNonCriticalRegion => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ThreadRudeAbortInCriticalRegion => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPR_AppDomainUnload => 3

    /**
     * @type {Integer (Int32)}
     */
    static OPR_AppDomainRudeUnload => 4

    /**
     * @type {Integer (Int32)}
     */
    static OPR_ProcessExit => 5

    /**
     * @type {Integer (Int32)}
     */
    static OPR_FinalizerRun => 6

    /**
     * @type {Integer (Int32)}
     */
    static MaxClrOperation => 7
}
