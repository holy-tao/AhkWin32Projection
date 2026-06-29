#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorPropertyAttr {
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
    static prSpecialName => 512

    /**
     * @type {Integer (Int32)}
     */
    static prReservedMask => 62464

    /**
     * @type {Integer (Int32)}
     */
    static prRTSpecialName => 1024

    /**
     * @type {Integer (Int32)}
     */
    static prHasDefault => 4096

    /**
     * @type {Integer (Int32)}
     */
    static prUnused => 59903
}
