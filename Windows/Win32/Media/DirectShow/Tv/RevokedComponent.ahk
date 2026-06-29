#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct RevokedComponent {
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
    static REVOKED_COPP => 0

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_SAC => 1

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_APP_STUB => 2

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_SECURE_PIPELINE => 3

    /**
     * @type {Integer (Int32)}
     */
    static REVOKED_MAX_TYPES => 4
}
