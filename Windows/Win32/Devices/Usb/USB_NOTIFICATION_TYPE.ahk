#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_NOTIFICATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EnumerationFailure => 0

    /**
     * @type {Integer (Int32)}
     */
    static InsufficentBandwidth => 1

    /**
     * @type {Integer (Int32)}
     */
    static InsufficentPower => 2

    /**
     * @type {Integer (Int32)}
     */
    static OverCurrent => 3

    /**
     * @type {Integer (Int32)}
     */
    static ResetOvercurrent => 4

    /**
     * @type {Integer (Int32)}
     */
    static AcquireBusInfo => 5

    /**
     * @type {Integer (Int32)}
     */
    static AcquireHubName => 6

    /**
     * @type {Integer (Int32)}
     */
    static AcquireControllerName => 7

    /**
     * @type {Integer (Int32)}
     */
    static HubOvercurrent => 8

    /**
     * @type {Integer (Int32)}
     */
    static HubPowerChange => 9

    /**
     * @type {Integer (Int32)}
     */
    static HubNestedTooDeeply => 10

    /**
     * @type {Integer (Int32)}
     */
    static ModernDeviceInLegacyHub => 11
}
