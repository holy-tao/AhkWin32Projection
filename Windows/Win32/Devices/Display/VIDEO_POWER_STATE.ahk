#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class VIDEO_POWER_STATE extends Win32Enum {

    /**
     * Native name: VideoPowerUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: VideoPowerOn
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Native name: VideoPowerStandBy
     * @type {Integer (Int32)}
     */
    static StandBy => 2

    /**
     * Native name: VideoPowerSuspend
     * @type {Integer (Int32)}
     */
    static Suspend => 3

    /**
     * Native name: VideoPowerOff
     * @type {Integer (Int32)}
     */
    static Off => 4

    /**
     * Native name: VideoPowerHibernate
     * @type {Integer (Int32)}
     */
    static Hibernate => 5

    /**
     * Native name: VideoPowerShutdown
     * @type {Integer (Int32)}
     */
    static Shutdown => 6

    /**
     * Native name: VideoPowerMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 7
}
