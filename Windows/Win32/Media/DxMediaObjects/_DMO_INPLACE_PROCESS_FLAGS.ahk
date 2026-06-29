#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct _DMO_INPLACE_PROCESS_FLAGS {
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
    static DMO_INPLACE_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DMO_INPLACE_ZERO => 1
}
