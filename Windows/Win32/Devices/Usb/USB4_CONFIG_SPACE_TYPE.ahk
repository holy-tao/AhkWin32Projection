#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USB4_CONFIG_SPACE_TYPE extends Win32Enum {

    /**
     * Native name: USB4PathConfigurationSpace
     * @type {Integer (Int32)}
     */
    static PathConfigurationSpace => 0

    /**
     * Native name: USB4AdapterConfigurationSpace
     * @type {Integer (Int32)}
     */
    static AdapterConfigurationSpace => 1

    /**
     * Native name: USB4RouterConfigurationSpace
     * @type {Integer (Int32)}
     */
    static RouterConfigurationSpace => 2

    /**
     * Native name: USB4CounterConfigurationSpace
     * @type {Integer (Int32)}
     */
    static CounterConfigurationSpace => 3
}
