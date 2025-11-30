#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB4_CONFIG_SPACE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USB4PathConfigurationSpace => 0

    /**
     * @type {Integer (Int32)}
     */
    static USB4AdapterConfigurationSpace => 1

    /**
     * @type {Integer (Int32)}
     */
    static USB4RouterConfigurationSpace => 2

    /**
     * @type {Integer (Int32)}
     */
    static USB4CounterConfigurationSpace => 3
}
