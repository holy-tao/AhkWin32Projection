#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorNativeLinkFlags {
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
    static nlfNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static nlfLastError => 1

    /**
     * @type {Integer (Int32)}
     */
    static nlfNoMangle => 2

    /**
     * @type {Integer (Int32)}
     */
    static nlfMaxValue => 3
}
