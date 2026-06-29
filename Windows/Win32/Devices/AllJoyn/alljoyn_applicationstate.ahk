#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_applicationstate {
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
    static NOT_CLAIMABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLAIMABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLAIMED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NEED_UPDATE => 3
}
