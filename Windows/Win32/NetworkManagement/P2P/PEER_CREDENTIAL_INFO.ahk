#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_CREDENTIAL_INFO structure defines information used to obtain and issue a peer's security credentials.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_credential_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_CREDENTIAL_INFO {
    #StructPack 8

    /**
     * Specifies the size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Reserved. This field must be set to 0.
     */
    dwFlags : UInt32

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the issuer.
     */
    pwzFriendlyName : PWSTR

    /**
     * Pointer to a <b>CERT_PUBLIC_KEY_INFO</b> structure that contains the peer group member's public key and the encryption type it uses.
     */
    pPublicKey : CERT_PUBLIC_KEY_INFO.Ptr

    /**
     * Pointer to a Unicode string that specifies the membership issuer's PNRP name.
     */
    pwzIssuerPeerName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the issuer.
     */
    pwzIssuerFriendlyName : PWSTR

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure that contains the time when the recipient's membership in the peer group becomes valid. When issuing new credentials this value must be greater than the ValidityStart value for the member's current credentials.
     */
    ftValidityStart : FILETIME

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure that contains the time when the recipient's membership in the peer group becomes invalid.
     */
    ftValidityEnd : FILETIME

    /**
     * Specifies the number of role GUIDs present in <b>pRoles</b>.
     */
    cRoles : UInt32

    /**
     * Pointer to a list of GUIDs that specifies the combined set of available roles. The available roles are as follows.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GROUP_ROLE_ADMIN"></a><a id="peer_group_role_admin"></a><dl>
     * <dt><b>PEER_GROUP_ROLE_ADMIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This role can issue invitations, issue credentials,   and renew the GMC of other administrators, as well as behave as a member of the peer group.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GROUP_ROLE_MEMBER"></a><a id="peer_group_role_member"></a><dl>
     * <dt><b>PEER_GROUP_ROLE_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The role can add records to the peer group database.
     * 
     * </td>
     * </tr>
     * </table>
     */
    pRoles : Guid.Ptr

}
