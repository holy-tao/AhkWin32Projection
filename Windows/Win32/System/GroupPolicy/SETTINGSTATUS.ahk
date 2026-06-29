#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct SETTINGSTATUS {
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
    static RSOPUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static RSOPApplied => 1

    /**
     * @type {Integer (Int32)}
     */
    static RSOPIgnored => 2

    /**
     * @type {Integer (Int32)}
     */
    static RSOPFailed => 3

    /**
     * @type {Integer (Int32)}
     */
    static RSOPSubsettingFailed => 4
}
