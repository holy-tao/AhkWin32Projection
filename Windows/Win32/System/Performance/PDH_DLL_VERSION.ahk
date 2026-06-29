#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_DLL_VERSION {
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
    static PDH_CVERSION_WIN50 => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_VERSION => 1283
}
