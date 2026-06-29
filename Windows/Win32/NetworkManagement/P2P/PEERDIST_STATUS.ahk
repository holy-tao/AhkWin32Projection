#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * PEERDIST_STATUS enumeration defines the possible status values of the Peer Distribution service.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ne-peerdist-peerdist_status
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The service is disabled by Group Policy or according to configuration parameters.
     * @type {Integer (Int32)}
     */
    static PEERDIST_STATUS_DISABLED => 0

    /**
     * The service is not ready to process the request.
     * @type {Integer (Int32)}
     */
    static PEERDIST_STATUS_UNAVAILABLE => 1

    /**
     * The Peer Distribution service  is available and ready to process  requests.
     * @type {Integer (Int32)}
     */
    static PEERDIST_STATUS_AVAILABLE => 2
}
