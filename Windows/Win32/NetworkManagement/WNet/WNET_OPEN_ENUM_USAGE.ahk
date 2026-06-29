#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct WNET_OPEN_ENUM_USAGE {
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
    static RESOURCEUSAGE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_CONNECTABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_CONTAINER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_ATTACHED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_ALL => 19
}
