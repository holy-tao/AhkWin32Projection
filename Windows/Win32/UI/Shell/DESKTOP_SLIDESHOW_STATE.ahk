#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DESKTOP_SLIDESHOW_STATE {
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
    static DSS_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DSS_SLIDESHOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static DSS_DISABLED_BY_REMOTE_SESSION => 4
}
