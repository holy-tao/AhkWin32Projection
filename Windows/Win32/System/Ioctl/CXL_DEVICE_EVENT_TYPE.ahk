#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: CxlDeviceEventType_HealthStatusChange
     * @type {Integer (Int32)}
     */
    static HealthStatusChange => 0

    /**
     * Native name: CxlDeviceEventType_MediaStatusChange
     * @type {Integer (Int32)}
     */
    static MediaStatusChange => 1

    /**
     * Native name: CxlDeviceEventType_LifeUsedChange
     * @type {Integer (Int32)}
     */
    static LifeUsedChange => 2

    /**
     * Native name: CxlDeviceEventType_TemperatureChange
     * @type {Integer (Int32)}
     */
    static TemperatureChange => 3

    /**
     * Native name: CxlDeviceEventType_DataPathError
     * @type {Integer (Int32)}
     */
    static DataPathError => 4

    /**
     * Native name: CxlDeviceEventType_LsaError
     * @type {Integer (Int32)}
     */
    static LsaError => 5

    /**
     * Native name: CxlDeviceEventType_UnrecorverableInternalSideBandBusError
     * @type {Integer (Int32)}
     */
    static UnrecorverableInternalSideBandBusError => 6

    /**
     * Native name: CxlDeviceEventType_MemoryMediaFruError
     * @type {Integer (Int32)}
     */
    static MemoryMediaFruError => 7

    /**
     * Native name: CxlDeviceEventType_PowerManagementFault
     * @type {Integer (Int32)}
     */
    static PowerManagementFault => 8
}
