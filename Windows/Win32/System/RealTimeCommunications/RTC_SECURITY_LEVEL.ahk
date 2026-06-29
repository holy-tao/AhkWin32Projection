#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct RTC_SECURITY_LEVEL {
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
    static RTCSECL_UNSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECL_SUPPORTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static RTCSECL_REQUIRED => 3
}
