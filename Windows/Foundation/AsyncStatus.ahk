#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the status of an asynchronous operation.
 * @remarks
 * This enumeration is used as a value for [IAsyncInfo.Status](iasyncinfo_status.md) (the basic status reporting mechanism for asynchronous operations) and also by specific operation implementations (for example [GetSmsDeviceOperation.Status](../windows.devices.sms/getsmsdeviceoperation_status.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.asyncstatus
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class AsyncStatus extends Win32Enum{

    /**
     * The operation was canceled.
     * @type {Integer (Int32)}
     */
    static Canceled => 2

    /**
     * The operation has completed.
     * @type {Integer (Int32)}
     */
    static Completed => 1

    /**
     * The operation has encountered an error.
     * @type {Integer (Int32)}
     */
    static Error => 3

    /**
     * The operation has started.
     * @type {Integer (Int32)}
     */
    static Started => 0
}
