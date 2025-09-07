#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IOD_DESFLAGS{

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
