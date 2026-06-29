#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct QUEUE_STATUS_FLAGS {
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
    static QS_ALLEVENTS => 1215

    /**
     * @type {Integer (UInt32)}
     */
    static QS_ALLINPUT => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static QS_ALLPOSTMESSAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static QS_HOTKEY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static QS_INPUT => 1031

    /**
     * @type {Integer (UInt32)}
     */
    static QS_KEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QS_MOUSE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static QS_MOUSEBUTTON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QS_MOUSEMOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QS_PAINT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QS_POSTMESSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static QS_RAWINPUT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static QS_SENDMESSAGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static QS_TIMER => 16
}
