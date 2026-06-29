#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHGSI_FLAGS {
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
    static SHGSI_ICONLOCATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_ICON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SYSICONINDEX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_LINKOVERLAY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SELECTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_LARGEICON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SMALLICON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHGSI_SHELLICONSIZE => 4
}
