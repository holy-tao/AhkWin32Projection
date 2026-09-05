#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class HDV_DEVICE_HOST_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: HdvDeviceHostFlagNone
     * @type {Integer (Int32)}
     */
    static FlagNone => 0

    /**
     * Native name: HdvDeviceHostFlagInitializeComSecurity
     * @type {Integer (Int32)}
     */
    static FlagInitializeComSecurity => 1
}
