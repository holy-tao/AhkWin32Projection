#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_GROUP_AUTHENTICATION_SCHEME.ahk" { PEER_GROUP_AUTHENTICATION_SCHEME }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_INVITATION_INFO structure defines information about an invitation to join a peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_invitation_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_INVITATION_INFO {
    #StructPack 8

    /**
     * Specifies the size of this structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Must be set to 0x00000000.
     */
    dwFlags : UInt32

    /**
     * Pointer to a Unicode string that specifies the PNRP cloud name.
     */
    pwzCloudName : PWSTR

    /**
     * Specifies the scope under which the peer group was registered.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_GLOBAL_SCOPE"></a><a id="pnrp_global_scope"></a><dl>
     * <dt><b>PNRP_GLOBAL_SCOPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Global scope, including the Internet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_LOCAL_SCOPE"></a><a id="pnrp_local_scope"></a><dl>
     * <dt><b>PNRP_LOCAL_SCOPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Local scope.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_LINK_LOCAL_SCOPE"></a><a id="pnrp_link_local_scope"></a><dl>
     * <dt><b>PNRP_LINK_LOCAL_SCOPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Link-local scope.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwScope : UInt32

    /**
     * Specifies a set of flags that describe PNRP cloud features.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_CLOUD_NO_FLAGS"></a><a id="pnrp_cloud_no_flags"></a><dl>
     * <dt><b>PNRP_CLOUD_NO_FLAGS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No flags are set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PNRP_CLOUD_NAME_LOCAL"></a><a id="pnrp_cloud_name_local"></a><dl>
     * <dt><b>PNRP_CLOUD_NAME_LOCAL</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The cloud name is not available on other computers; it is locally defined.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCloudFlags : UInt32

    /**
     * Pointer to a Unicode string that specifies the peer name of the peer group.
     */
    pwzGroupPeerName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the PNRP name of the peer issuing the invitation.
     */
    pwzIssuerPeerName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the PNRP name of the peer that receives the invitation.
     */
    pwzSubjectPeerName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the peer group.
     */
    pwzGroupFriendlyName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the peer issuing the invitation.
     */
    pwzIssuerFriendlyName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the peer that receives the invitation.
     */
    pwzSubjectFriendlyName : PWSTR

    /**
     * Specifies a UTC <b>FILETIME</b> value that indicates when the invitation  becomes valid.
     */
    ftValidityStart : FILETIME

    /**
     * Specifies a UTC <b>FILETIME</b> value that indicates when the invitation becomes invalid.
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
     * This role can issue invitations, renew memberships, modify peer group properties, publish and update records, and renew the GMC of other administrators.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PEER_GROUP_ROLE_MEMBER"></a><a id="peer_group_role_member"></a><dl>
     * <dt><b>PEER_GROUP_ROLE_MEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The role can publish records to the peer group database.
     * 
     * </td>
     * </tr>
     * </table>
     */
    pRoles : Guid.Ptr

    /**
     * Unsigned integer value that contains the number of string values listed in <b>ppwzClassifiers</b>. This field is reserved for future use.
     */
    cClassifiers : UInt32

    /**
     * List of pointers to Unicode strings. This field is reserved for future use.
     */
    ppwzClassifiers : PWSTR.Ptr

    /**
     * Pointer to a <b>CERT_PUBLIC_KEY_INFO</b> structure that contains the recipient's returned public key and the encryption algorithm type it uses.
     */
    pSubjectPublicKey : CERT_PUBLIC_KEY_INFO.Ptr

    /**
     * <b>Windows Vista or later.</b>           The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_authentication_scheme">PEER_GROUP_AUTHENTICATION_SCHEME</a> enumeration value that indicates the type of authentication used to validate the peer group invitee.
     * @deprecated
     */
    authScheme : PEER_GROUP_AUTHENTICATION_SCHEME

}
