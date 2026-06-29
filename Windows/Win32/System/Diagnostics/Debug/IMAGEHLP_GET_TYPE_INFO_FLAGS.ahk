#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_GET_TYPE_INFO_FLAGS {
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
    static IMAGEHLP_GET_TYPE_INFO_CHILDREN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGEHLP_GET_TYPE_INFO_UNCACHED => 1
}
