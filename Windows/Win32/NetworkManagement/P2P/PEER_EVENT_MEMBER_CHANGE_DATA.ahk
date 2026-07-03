#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_MEMBER_CHANGE_TYPE.ahk" { PEER_MEMBER_CHANGE_TYPE }

/**
 * The PEER_EVENT_MEMBER_CHANGE_DATA structure contains data that describes a change in the status of a peer group member.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_member_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_MEMBER_CHANGE_DATA {
    #StructPack 8

    /**
     * Contains the size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * <b>PEER_MEMBER_CHANGE_TYPE</b> enumeration value that specifies the change event that occurred, such as a member joining or leaving.
     * @deprecated
     */
    changeType : PEER_MEMBER_CHANGE_TYPE

    /**
     * Pointer to a Unicode string that contains the peer name of the peer group member.
     */
    pwzIdentity : PWSTR

}
