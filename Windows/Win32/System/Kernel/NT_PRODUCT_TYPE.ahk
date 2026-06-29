#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct NT_PRODUCT_TYPE {
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
    static NtProductWinNt => 1

    /**
     * @type {Integer (Int32)}
     */
    static NtProductLanManNt => 2

    /**
     * @type {Integer (Int32)}
     */
    static NtProductServer => 3
}
