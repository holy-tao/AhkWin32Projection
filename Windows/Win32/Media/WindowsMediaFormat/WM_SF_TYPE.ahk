#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_SF_TYPE {
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
    static WM_SF_CLEANPOINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WM_SF_DISCONTINUITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WM_SF_DATALOSS => 4
}
