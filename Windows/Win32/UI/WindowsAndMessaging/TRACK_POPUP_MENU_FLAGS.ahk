#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TRACK_POPUP_MENU_FLAGS {
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
    static TPM_LEFTBUTTON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RIGHTBUTTON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_LEFTALIGN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_CENTERALIGN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RIGHTALIGN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_TOPALIGN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VCENTERALIGN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_BOTTOMALIGN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_HORIZONTAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERTICAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_NONOTIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RETURNCMD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RECURSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_HORPOSANIMATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_HORNEGANIMATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERPOSANIMATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERNEGANIMATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_NOANIMATION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_LAYOUTRTL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_WORKAREA => 65536
}
