#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS enumeration defines the possible client information values.
 * @remarks
 * A value from this enumeration is passed to the<a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientgetinformationbyhandle">PeerDistClientGetInformationByHandle</a> function as the <i>PeerDistClientInfoClass</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ne-peerdist-peerdist_client_info_by_handle_class
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_CLIENT_INFO_BY_HANDLE_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the information to retrieve is a <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ns-peerdist-peerdist_client_basic_info">PEERDIST_CLIENT_BASIC_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PeerDistClientBasicInfo => 0

    /**
     * The maximum value for the enumeration that is used for error checking.  This value should not be sent to the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/nf-peerdist-peerdistclientgetinformationbyhandle">PeerDistClientGetInformationByHandle</a> function.
     * @type {Integer (Int32)}
     */
    static MaximumPeerDistClientInfoByHandlesClass => 1
}
