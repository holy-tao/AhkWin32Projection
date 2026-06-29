#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct SCRIPTSTATE {
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
    static SCRIPTSTATE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_INITIALIZED => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_STARTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_CONNECTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_DISCONNECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTSTATE_CLOSED => 4
}
