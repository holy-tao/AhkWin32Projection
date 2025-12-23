#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_POWER_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerStandBy => 2

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerSuspend => 3

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerOff => 4

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerHibernate => 5

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerShutdown => 6

    /**
     * @type {Integer (Int32)}
     */
    static VideoPowerMaximum => 7
}
