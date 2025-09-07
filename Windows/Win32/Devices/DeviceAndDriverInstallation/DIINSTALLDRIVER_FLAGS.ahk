#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class DIINSTALLDRIVER_FLAGS{

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
