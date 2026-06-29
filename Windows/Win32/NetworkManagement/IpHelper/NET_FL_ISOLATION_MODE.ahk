#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct NET_FL_ISOLATION_MODE {
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
    static NetFlIsolationModeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetFlIsolationModeVlan => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetFlIsolationModeVsid => 2
}
