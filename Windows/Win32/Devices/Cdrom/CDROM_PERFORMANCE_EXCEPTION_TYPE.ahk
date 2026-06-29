#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_PERFORMANCE_EXCEPTION_TYPE {
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
    static CdromNominalPerformance => 1

    /**
     * @type {Integer (Int32)}
     */
    static CdromEntirePerformanceList => 2

    /**
     * @type {Integer (Int32)}
     */
    static CdromPerformanceExceptionsOnly => 3
}
