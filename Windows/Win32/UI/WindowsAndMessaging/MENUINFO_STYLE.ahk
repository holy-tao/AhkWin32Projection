#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MENUINFO_STYLE {
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
    static MNS_AUTODISMISS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_CHECKORBMP => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_DRAGDROP => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_MODELESS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_NOCHECK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MNS_NOTIFYBYPOS => 134217728
}
