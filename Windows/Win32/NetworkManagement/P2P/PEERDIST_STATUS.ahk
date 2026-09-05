#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * PEERDIST_STATUS enumeration defines the possible status values of the Peer Distribution service.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ne-peerdist-peerdist_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEERDIST_STATUS extends Win32Enum {

    /**
     * The service is disabled by Group Policy or according to configuration parameters.
     * Native name: PEERDIST_STATUS_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 0

    /**
     * The service is not ready to process the request.
     * Native name: PEERDIST_STATUS_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static UNAVAILABLE => 1

    /**
     * The Peer Distribution service  is available and ready to process  requests.
     * Native name: PEERDIST_STATUS_AVAILABLE
     * @type {Integer (Int32)}
     */
    static AVAILABLE => 2
}
