#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct KBDLLHOOKSTRUCT_FLAGS {
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
    static LLKHF_EXTENDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_ALTDOWN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_UP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_INJECTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_LOWER_IL_INJECTED => 2
}
