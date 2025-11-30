#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class POWER_STATE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SystemPowerState => 0

    /**
     * @type {Integer (Int32)}
     */
    static DevicePowerState => 1
}
