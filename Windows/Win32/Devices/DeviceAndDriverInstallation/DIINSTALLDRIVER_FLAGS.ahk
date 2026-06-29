#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DIINSTALLDRIVER_FLAGS {
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
    static DIIRFLAG_BITS => 106

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_SYSTEM_BITS => 127

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_INF_ALREADY_COPIED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_FORCE_INF => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_HW_USING_THE_INF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_HOTPATCH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_NOBACKUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_PRE_CONFIGURE_INF => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DIIRFLAG_INSTALL_AS_SET => 64
}
