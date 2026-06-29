#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct TARGET_OWNER {
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
    static OWNER_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static OWNER_MS_TS_PLUGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static OWNER_MS_VM_PLUGIN => 2
}
