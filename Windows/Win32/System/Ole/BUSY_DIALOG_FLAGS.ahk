#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct BUSY_DIALOG_FLAGS {
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
    static BZ_DISABLECANCELBUTTON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BZ_DISABLESWITCHTOBUTTON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BZ_DISABLERETRYBUTTON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BZ_NOTRESPONDINGDIALOG => 8
}
