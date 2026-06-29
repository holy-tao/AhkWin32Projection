#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct CM_RESTYPE {
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
