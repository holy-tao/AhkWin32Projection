#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPO_SECTION {
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
    static GPO_SECTION_ROOT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_SECTION_USER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GPO_SECTION_MACHINE => 2
}
