#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The PEER_INVITATION_INFO structure defines information about an invitation to join a peer group.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_invitation_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_INVITATION_INFO extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Specifies the size of this structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Must be set to 0x00000000.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a Unicode string that specifies the PNRP cloud name.
     * @type {PWSTR}
     */
    pwzCloudName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

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
     * @type {Integer}
     */
    dwScope {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

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
     * @type {Integer}
     */
    dwCloudFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Pointer to a Unicode string that specifies the peer name of the peer group.
     * @type {PWSTR}
     */
    pwzGroupPeerName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a Unicode string that specifies the PNRP name of the peer issuing the invitation.
     * @type {PWSTR}
     */
    pwzIssuerPeerName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Pointer to a Unicode string that specifies the PNRP name of the peer that receives the invitation.
     * @type {PWSTR}
     */
    pwzSubjectPeerName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the peer group.
     * @type {PWSTR}
     */
    pwzGroupFriendlyName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the peer issuing the invitation.
     * @type {PWSTR}
     */
    pwzIssuerFriendlyName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the peer that receives the invitation.
     * @type {PWSTR}
     */
    pwzSubjectFriendlyName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Specifies a UTC <b>FILETIME</b> value that indicates when the invitation  becomes valid.
     * @type {FILETIME}
     */
    ftValidityStart{
        get {
            if(!this.HasProp("__ftValidityStart"))
                this.__ftValidityStart := FILETIME(72, this)
            return this.__ftValidityStart
        }
    }

    /**
     * Specifies a UTC <b>FILETIME</b> value that indicates when the invitation becomes invalid.
     * @type {FILETIME}
     */
    ftValidityEnd{
        get {
            if(!this.HasProp("__ftValidityEnd"))
                this.__ftValidityEnd := FILETIME(80, this)
            return this.__ftValidityEnd
        }
    }

    /**
     * Specifies the number of role GUIDs present in <b>pRoles</b>.
     * @type {Integer}
     */
    cRoles {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

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
     * @type {Pointer<Guid>}
     */
    pRoles {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Unsigned integer value that contains the number of string values listed in <b>ppwzClassifiers</b>. This field is reserved for future use.
     * @type {Integer}
     */
    cClassifiers {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * List of pointers to Unicode strings. This field is reserved for future use.
     * @type {Pointer<PWSTR>}
     */
    ppwzClassifiers {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Pointer to a <b>CERT_PUBLIC_KEY_INFO</b> structure that contains the recipient's returned public key and the encryption algorithm type it uses.
     * @type {Pointer<CERT_PUBLIC_KEY_INFO>}
     */
    pSubjectPublicKey {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * <b>Windows Vista or later.</b>           The <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_authentication_scheme">PEER_GROUP_AUTHENTICATION_SCHEME</a> enumeration value that indicates the type of authentication used to validate the peer group invitee.
     * @deprecated 
     * @type {Integer}
     */
    authScheme {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }
}
