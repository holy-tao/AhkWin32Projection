#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PEER_MEMBER_FLAGS flag allows an application to specify whether all members or only present ones should be enumerated when the PeerGroupEnumMembers function is called, or to indicate whether or not a member is present within the peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ne-p2p-peer_member_flags
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_MEMBER_FLAGS extends Win32Enum{

    /**
     * The member is present in the peer group.
     * @type {Integer (Int32)}
     */
    static PEER_MEMBER_PRESENT => 1
}
