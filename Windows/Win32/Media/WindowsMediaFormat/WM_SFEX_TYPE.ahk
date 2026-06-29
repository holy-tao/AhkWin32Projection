#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_SFEX_TYPE {
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
    static WM_SFEX_NOTASYNCPOINT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WM_SFEX_DATALOSS => 4
}
