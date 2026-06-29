#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NOTIFY_ICON_DATA_FLAGS {
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
    static NIF_MESSAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_ICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_TIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_INFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_GUID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_REALTIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_SHOWTIP => 128
}
