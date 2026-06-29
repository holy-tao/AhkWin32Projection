#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IF_ENTRY_LEVEL {
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
    static MibIfEntryNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static MibIfEntryNormalWithoutStatistics => 2
}
