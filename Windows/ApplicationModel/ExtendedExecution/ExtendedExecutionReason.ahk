#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the reason for the background execution request.
 * @remarks
 * Lifetime data for the various reasons:
 * 
 * | Reason | Extended execution session lifetime |
 * |----------|--------------------------------------------|
 * | LocationTracking | No limit. Only one app at a time may request this reason. |
 * | SavingData | 10 minutes maximum. |
 * | Unspecified |  10 minutes maximum on battery power. No limit when the device is connected to power. |
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionreason
 * @namespace Windows.ApplicationModel.ExtendedExecution
 * @version WindowsRuntime 1.4
 */
class ExtendedExecutionReason extends Win32Enum{

    /**
     * No reason specified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * To support location tracking.
     * @type {Integer (Int32)}
     */
    static LocationTracking => 1

    /**
     * To save data.
     * @type {Integer (Int32)}
     */
    static SavingData => 2
}
