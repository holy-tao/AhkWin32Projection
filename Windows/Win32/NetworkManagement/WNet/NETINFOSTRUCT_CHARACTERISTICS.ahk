#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct NETINFOSTRUCT_CHARACTERISTICS {
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
    static NETINFO_DLL16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETINFO_DISKRED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETINFO_PRINTERRED => 8
}
