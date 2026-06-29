#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASCONNSUBSTATE {
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
    static RASCSS_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_Dormant => 1

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_Reconnecting => 2

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_Reconnected => 8192
}
