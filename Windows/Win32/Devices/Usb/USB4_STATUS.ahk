#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB4_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static ErrConn => 0

    /**
     * @type {Integer (Int32)}
     */
    static ErrLink => 1

    /**
     * @type {Integer (Int32)}
     */
    static ErrAddr => 2

    /**
     * @type {Integer (Int32)}
     */
    static ErrAdp => 4

    /**
     * @type {Integer (Int32)}
     */
    static HpAck => 7

    /**
     * @type {Integer (Int32)}
     */
    static ErrEnum => 8

    /**
     * @type {Integer (Int32)}
     */
    static ErrNua => 9

    /**
     * @type {Integer (Int32)}
     */
    static ErrLen => 11

    /**
     * @type {Integer (Int32)}
     */
    static ErrHec => 12

    /**
     * @type {Integer (Int32)}
     */
    static ErrFc => 13

    /**
     * @type {Integer (Int32)}
     */
    static ErrPlug => 14

    /**
     * @type {Integer (Int32)}
     */
    static ErrLock => 15

    /**
     * @type {Integer (Int32)}
     */
    static DpBw => 32

    /**
     * @type {Integer (Int32)}
     */
    static RopCmplt => 33

    /**
     * @type {Integer (Int32)}
     */
    static PopCmplt => 34

    /**
     * @type {Integer (Int32)}
     */
    static PcieWake => 35

    /**
     * @type {Integer (Int32)}
     */
    static DpConChange => 36

    /**
     * @type {Integer (Int32)}
     */
    static DpTxDiscovery => 37

    /**
     * @type {Integer (Int32)}
     */
    static LinkRecovery => 38

    /**
     * @type {Integer (Int32)}
     */
    static AsymLink => 39

    /**
     * @type {Integer (Int32)}
     */
    static PollingSkipped => 252

    /**
     * @type {Integer (Int32)}
     */
    static PollingTimeout => 253

    /**
     * @type {Integer (Int32)}
     */
    static StatusSuccess => 254

    /**
     * @type {Integer (Int32)}
     */
    static StatusUnknown => 255
}
