#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IOD_DESFLAGS {
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
    static fIOD_PortType => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_Memory => 0

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_IO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_DECODE => 252

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_10_BIT_DECODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_12_BIT_DECODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_16_BIT_DECODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_POSITIVE_DECODE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_PASSIVE_DECODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_WINDOW_DECODE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static fIOD_PORT_BAR => 256
}
