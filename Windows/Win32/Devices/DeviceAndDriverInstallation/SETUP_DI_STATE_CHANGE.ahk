#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_STATE_CHANGE{

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_PROPCHANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_START => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_STOP => 5
}
