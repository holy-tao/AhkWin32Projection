#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_OPERATION\_STATES enumeration values describe the current state of an operation in progress.
 * @remarks
 * These values are received in the application-defined callback ([**IPortableDeviceEventCallback**](/windows/desktop/api/PortableDeviceApi/nn-portabledeviceapi-iportabledeviceeventcallback)).
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-operation-states
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_OPERATION_STATES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
