#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct NOTIFICATION_CALLBACK_COMMANDS {
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
    static NOTIFICATION_COMMAND_NOTIFY => 0

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_COMMAND_CONTEXT_ACQUIRE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_COMMAND_CONTEXT_RELEASE => 2
}
