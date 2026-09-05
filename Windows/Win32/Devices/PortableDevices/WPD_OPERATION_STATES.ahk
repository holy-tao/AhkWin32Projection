#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_OPERATION\_STATES enumeration values describe the current state of an operation in progress.
 * @remarks
 * These values are received in the application-defined callback ([**IPortableDeviceEventCallback**](/windows/desktop/api/PortableDeviceApi/nn-portabledeviceapi-iportabledeviceeventcallback)).
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-operation-states
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_OPERATION_STATES extends Win32Enum {

    /**
     * Native name: WPD_OPERATION_STATE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static STATE_UNSPECIFIED => 0

    /**
     * Native name: WPD_OPERATION_STATE_STARTED
     * @type {Integer (Int32)}
     */
    static STATE_STARTED => 1

    /**
     * Native name: WPD_OPERATION_STATE_RUNNING
     * @type {Integer (Int32)}
     */
    static STATE_RUNNING => 2

    /**
     * Native name: WPD_OPERATION_STATE_PAUSED
     * @type {Integer (Int32)}
     */
    static STATE_PAUSED => 3

    /**
     * Native name: WPD_OPERATION_STATE_CANCELLED
     * @type {Integer (Int32)}
     */
    static STATE_CANCELLED => 4

    /**
     * Native name: WPD_OPERATION_STATE_FINISHED
     * @type {Integer (Int32)}
     */
    static STATE_FINISHED => 5

    /**
     * Native name: WPD_OPERATION_STATE_ABORTED
     * @type {Integer (Int32)}
     */
    static STATE_ABORTED => 6
}
