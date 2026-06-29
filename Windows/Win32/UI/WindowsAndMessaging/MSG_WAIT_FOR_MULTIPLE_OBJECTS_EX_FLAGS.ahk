#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MSG_WAIT_FOR_MULTIPLE_OBJECTS_EX_FLAGS {
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
    static MWMO_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_ALERTABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_INPUTAVAILABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MWMO_WAITALL => 1
}
