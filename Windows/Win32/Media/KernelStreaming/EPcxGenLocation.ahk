#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct EPcxGenLocation {
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
    static eGenLocPrimaryBox => 0

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocInternal => 1

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocSeparate => 2

    /**
     * @type {Integer (Int32)}
     */
    static eGenLocOther => 3

    /**
     * @type {Integer (Int32)}
     */
    static EPcxGenLocation_enum_count => 4
}
