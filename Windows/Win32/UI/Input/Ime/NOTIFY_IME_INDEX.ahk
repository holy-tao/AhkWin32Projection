#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct NOTIFY_IME_INDEX {
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
    static CPS_CANCEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_COMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_CONVERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPS_REVERT => 3
}
