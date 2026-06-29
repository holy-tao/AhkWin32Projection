#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorEventAttr {
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
    static evSpecialName => 512

    /**
     * @type {Integer (Int32)}
     */
    static evReservedMask => 1024

    /**
     * @type {Integer (Int32)}
     */
    static evRTSpecialName => 1024
}
