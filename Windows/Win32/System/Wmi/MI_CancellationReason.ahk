#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Value to pass to an operation cancel request to notify the system of the reason the operation is being canceled. If the service is being shutdown, it may pass one of these values to the provider as well.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ne-mi-mi_cancellationreason
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_CancellationReason extends Win32Enum{

    /**
     * No reason for cancellation.
     * @type {Integer (Int32)}
     */
    static MI_REASON_NONE => 0

    /**
     * Operation timed out.
     * @type {Integer (Int32)}
     */
    static MI_REASON_TIMEOUT => 1

    /**
     * The system is being shutdown.
     * @type {Integer (Int32)}
     */
    static MI_REASON_SHUTDOWN => 2

    /**
     * The service is being stopped.
     * @type {Integer (Int32)}
     */
    static MI_REASON_SERVICESTOP => 3
}
