#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * . (PEER_GROUP_ISSUE_CREDENTIAL_FLAGS)
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_group_issue_credential_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GROUP_ISSUE_CREDENTIAL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * When the <b>PEER_GROUP_STORE_CREDENTIALS</b> flag is set, the user  credentials are stored within a group database to be retrieved when the user connects. If the flag is not set, any new credentials are returned in string form and must be passed to the user out-of-band.
     * @type {Integer (Int32)}
     */
    static PEER_GROUP_STORE_CREDENTIALS => 1
}
