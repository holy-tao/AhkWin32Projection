#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Controls how much error information is included in a fault. Since the error object may contain sensitive data as part of the error string, it is not always appropriate to include the error strings information in all faults.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_fault_disclosure
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_FAULT_DISCLOSURE extends Win32Enum {

    /**
     * Use a generic fault string for all errors.
     * Native name: WS_MINIMAL_FAULT_DISCLOSURE
     * @type {Integer (Int32)}
     */
    static MINIMAL_FAULT_DISCLOSURE => 0

    /**
     * Use the error string as the fault string.
     * Native name: WS_FULL_FAULT_DISCLOSURE
     * @type {Integer (Int32)}
     */
    static FULL_FAULT_DISCLOSURE => 1
}
