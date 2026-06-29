#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_MEMBER_FLAGS flag allows an application to specify whether all members or only present ones should be enumerated when the PeerGroupEnumMembers function is called, or to indicate whether or not a member is present within the peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_member_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_MEMBER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The member is present in the peer group.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_PRESENT => 1
}
