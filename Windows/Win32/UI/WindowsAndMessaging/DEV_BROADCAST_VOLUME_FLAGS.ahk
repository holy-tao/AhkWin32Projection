#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_VOLUME_FLAGS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static DBTF_MEDIA => 1

    /**
     * @type {Integer (UInt16)}
     */
    static DBTF_NET => 2
}
