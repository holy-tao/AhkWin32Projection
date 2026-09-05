#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Value to pass to an operation cancel request to notify the system of the reason the operation is being canceled. If the service is being shutdown, it may pass one of these values to the provider as well.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_cancellationreason
 * @namespace Windows.Win32.System.Wmi
 */
class MI_CancellationReason extends Win32Enum {

    /**
     * No reason for cancellation.
     * Native name: MI_REASON_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Operation timed out.
     * Native name: MI_REASON_TIMEOUT
     * @type {Integer (Int32)}
     */
    static TIMEOUT => 1

    /**
     * The system is being shutdown.
     * Native name: MI_REASON_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static SHUTDOWN => 2

    /**
     * The service is being stopped.
     * Native name: MI_REASON_SERVICESTOP
     * @type {Integer (Int32)}
     */
    static SERVICESTOP => 3
}
