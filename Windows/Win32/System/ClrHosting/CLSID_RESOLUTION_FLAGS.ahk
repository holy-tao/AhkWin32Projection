#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct CLSID_RESOLUTION_FLAGS {
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
    static CLSID_RESOLUTION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLSID_RESOLUTION_REGISTERED => 1
}
