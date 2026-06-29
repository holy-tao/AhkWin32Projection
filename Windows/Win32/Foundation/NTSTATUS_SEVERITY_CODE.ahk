#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct NTSTATUS_SEVERITY_CODE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_INFORMATIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_ERROR => 3
}
