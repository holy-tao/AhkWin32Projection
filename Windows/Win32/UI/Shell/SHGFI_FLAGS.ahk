#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHGFI_FLAGS {
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
    static SHGFI_ADDOVERLAYS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_ATTR_SPECIFIED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_ATTRIBUTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_DISPLAYNAME => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_EXETYPE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_ICON => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_ICONLOCATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_LARGEICON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_LINKOVERLAY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_OPENICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_OVERLAYINDEX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_PIDL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_SELECTED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_SHELLICONSIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_SMALLICON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_SYSICONINDEX => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_TYPENAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SHGFI_USEFILEATTRIBUTES => 16
}
