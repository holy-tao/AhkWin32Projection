#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_ADDRESS.ahk" { PEER_ADDRESS }
#Import ".\PEER_CREDENTIAL_INFO.ahk" { PEER_CREDENTIAL_INFO }

/**
 * The PEER_MEMBER structure contains information that describes a member of a peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_member
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_MEMBER {
    #StructPack 8

    /**
     * Specifies the size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * PEER_MEMBER_FLAGS enumeration value that specifies the state of the member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_MEMBER_PRESENT"></a><a id="peer_member_present"></a><dl>
     * <dt><b>PEER_MEMBER_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The member is present in the peer group.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Pointer to a Unicode string that specifies the peer name of the member.
     */
    pwzIdentity : PWSTR

    /**
     * Pointer to a unicode string that specifies the attributes of the member. The format of this string is defined by the application.
     */
    pwzAttributes : PWSTR

    /**
     * Unsigned 64-bit integer that contains the node ID. The same peer can have several node IDs, each identifying a different node that participates in a different peer group.
     */
    ullNodeId : Int64

    /**
     * Specifies the number of IP addresses listed in <b>pAddress</b>.
     */
    cAddresses : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structures used by the member.
     */
    pAddresses : PEER_ADDRESS.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_credential_info">PEER_CREDENTIAL_INFO</a> structure that contains information about the security credentials of a member.
     */
    pCredentialInfo : PEER_CREDENTIAL_INFO.Ptr

}
