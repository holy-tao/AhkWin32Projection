#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct APP_CACHE_FINALIZE_STATE {
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
    static AppCacheFinalizeStateIncomplete => 0

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheFinalizeStateManifestChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheFinalizeStateComplete => 2
}
