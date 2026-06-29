#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_CONNECT_OPTIONS {
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
    static WBEM_FLAG_CONNECT_REPOSITORY_ONLY => 64

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_USE_MAX_WAIT => 128

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_CONNECT_PROVIDERS => 256
}
