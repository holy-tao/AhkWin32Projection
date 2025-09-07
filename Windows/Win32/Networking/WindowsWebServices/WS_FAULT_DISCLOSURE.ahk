#Requires AutoHotkey v2.0.0 64-bit

/**
 * Controls how much error information is included in a fault. Since the error object may contain sensitive data as part of the error string, it is not always appropriate to include the error strings information in all faults.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_fault_disclosure
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_FAULT_DISCLOSURE{

    /**
     * Use a generic fault string for all errors.
     * @type {Integer (Int32)}
     */
    static WS_MINIMAL_FAULT_DISCLOSURE => 0

    /**
     * Use the error string as the fault string.
     * @type {Integer (Int32)}
     */
    static WS_FULL_FAULT_DISCLOSURE => 1
}
