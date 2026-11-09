#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MEMORY_DEVICE_MEDIA_STATUS extends Win32Enum {

    /**
     * Native name: CxlMemoryDeviceMediaStatus_NotReady
     * @type {Integer (Int32)}
     */
    static NotReady => 0

    /**
     * Native name: CxlMemoryDeviceMediaStatus_Ready
     * @type {Integer (Int32)}
     */
    static Ready => 1

    /**
     * Native name: CxlMemoryDeviceMediaStatus_Error
     * @type {Integer (Int32)}
     */
    static Error => 2

    /**
     * Native name: CxlMemoryDeviceMediaStatus_Disabled
     * @type {Integer (Int32)}
     */
    static Disabled => 3

    /**
     * Native name: CxlMemoryDeviceMediaStatus_Max
     * @type {Integer (Int32)}
     */
    static Max => 4
}
