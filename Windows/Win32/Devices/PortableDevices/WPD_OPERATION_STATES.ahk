#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_OPERATION\_STATES enumeration values describe the current state of an operation in progress.
 * @remarks
 * These values are received in the application-defined callback ([**IPortableDeviceEventCallback**](/windows/desktop/api/PortableDeviceApi/nn-portabledeviceapi-iportabledeviceeventcallback)).
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-operation-states
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_OPERATION_STATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_STARTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_RUNNING => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_PAUSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_CANCELLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_FINISHED => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_OPERATION_STATE_ABORTED => 6
}
