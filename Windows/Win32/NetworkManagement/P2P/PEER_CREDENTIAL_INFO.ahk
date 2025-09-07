#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The PEER_CREDENTIAL_INFO structure defines information used to obtain and issue a peer's security credentials.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_credential_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_CREDENTIAL_INFO extends Win32Struct
{
    static sizeof => 72

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
     * Reserved. This field must be set to 0.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the issuer.
     * @type {PWSTR}
     */
    pwzFriendlyName{
        get {
            if(!this.HasProp("__pwzFriendlyName"))
                this.__pwzFriendlyName := PWSTR(this.ptr + 8)
            return this.__pwzFriendlyName
        }
    }

    /**
     * Pointer to a <b>CERT_PUBLIC_KEY_INFO</b> structure that contains the peer group member's public key and the encryption type it uses.
     * @type {Pointer<CERT_PUBLIC_KEY_INFO>}
     */
    pPublicKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a Unicode string that specifies the membership issuer's PNRP name.
     * @type {PWSTR}
     */
    pwzIssuerPeerName{
        get {
            if(!this.HasProp("__pwzIssuerPeerName"))
                this.__pwzIssuerPeerName := PWSTR(this.ptr + 24)
            return this.__pwzIssuerPeerName
        }
    }

    /**
     * Pointer to a Unicode string that specifies the friendly (display) name of the issuer.
     * @type {PWSTR}
     */
    pwzIssuerFriendlyName{
        get {
            if(!this.HasProp("__pwzIssuerFriendlyName"))
                this.__pwzIssuerFriendlyName := PWSTR(this.ptr + 32)
            return this.__pwzIssuerFriendlyName
        }
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure that contains the time when the recipient's membership in the peer group becomes valid. When issuing new credentials this value must be greater than the ValidityStart value for the member's current credentials.
     * @type {FILETIME}
     */
    ftValidityStart{
        get {
            if(!this.HasProp("__ftValidityStart"))
                this.__ftValidityStart := FILETIME(this.ptr + 40)
            return this.__ftValidityStart
        }
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/P2PSdk/graphing-reference-links">FILETIME</a> structure that contains the time when the recipient's membership in the peer group becomes invalid.
     * @type {FILETIME}
     */
    ftValidityEnd{
        get {
            if(!this.HasProp("__ftValidityEnd"))
                this.__ftValidityEnd := FILETIME(this.ptr + 48)
            return this.__ftValidityEnd
        }
    }

    /**
     * Specifies the number of role GUIDs present in <b>pRoles</b>.
     * @type {Integer}
     */
    cRoles {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
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
     * @type {Pointer<Guid>}
     */
    pRoles {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
