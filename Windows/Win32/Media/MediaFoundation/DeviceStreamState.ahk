#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DeviceStreamState extends Win32Enum {

    /**
     * Native name: DeviceStreamState_Stop
     * @type {Integer (Int32)}
     */
    static Stop => 0

    /**
     * Native name: DeviceStreamState_Pause
     * @type {Integer (Int32)}
     */
    static Pause => 1

    /**
     * Native name: DeviceStreamState_Run
     * @type {Integer (Int32)}
     */
    static Run => 2

    /**
     * Native name: DeviceStreamState_Disabled
     * @type {Integer (Int32)}
     */
    static Disabled => 3
}
