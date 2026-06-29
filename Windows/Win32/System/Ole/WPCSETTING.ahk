#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct WPCSETTING {
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
    static WPCSETTING_LOGGING_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPCSETTING_FILEDOWNLOAD_BLOCKED => 2
}
