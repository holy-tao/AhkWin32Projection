#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CeeSectionAttr {
    value : Int64

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int64)}
     */
    static sdNone => 0

    /**
     * @type {Integer (Int64)}
     */
    static sdReadOnly => 1073741888

    /**
     * @type {Integer (Int64)}
     */
    static sdReadWrite => 3221225536

    /**
     * @type {Integer (Int64)}
     */
    static sdExecute => 1610612768
}
