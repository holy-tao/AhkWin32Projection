#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Foundation.Metadata
 */
export default struct Architecture {
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
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static X86 => 1

    /**
     * @type {Integer (Int32)}
     */
    static X64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static Arm64 => 4

    /**
     * @type {Integer (Int32)}
     */
    static All => 7
}
