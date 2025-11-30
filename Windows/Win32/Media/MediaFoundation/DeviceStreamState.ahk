#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DeviceStreamState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Stop => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Pause => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Run => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceStreamState_Disabled => 3
}
