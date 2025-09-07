#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_RESTYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_All => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_Mem => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_IO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_DMA => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_IRQ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_DoNotUse => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_BusNumber => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_MemLarge => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_MAX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_Ignored_Bit => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_ClassSpecific => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_Reserved => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_DevicePrivate => 32769

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_PcCardConfig => 32770

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_MfCardConfig => 32771

    /**
     * @type {Integer (UInt32)}
     */
    static ResType_Connection => 32772
}
