#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_MEMBER structure contains information that describes a member of a peer group.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_member
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_MEMBER extends Win32Struct
{
    static sizeof => 56

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a Unicode string that specifies the peer name of the member.
     * @type {Pointer<PWSTR>}
     */
    pwzIdentity {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a unicode string that specifies the attributes of the member. The format of this string is defined by the application.
     * @type {Pointer<PWSTR>}
     */
    pwzAttributes {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Unsigned 64-bit integer that contains the node ID. The same peer can have several node IDs, each identifying a different node that participates in a different peer group.
     * @type {Integer}
     */
    ullNodeId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the number of IP addresses listed in <b>pAddress</b>.
     * @type {Integer}
     */
    cAddresses {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_address">PEER_ADDRESS</a> structures used by the member.
     * @type {Pointer<PEER_ADDRESS>}
     */
    pAddresses {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_credential_info">PEER_CREDENTIAL_INFO</a> structure that contains information about the security credentials of a member.
     * @type {Pointer<PEER_CREDENTIAL_INFO>}
     */
    pCredentialInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
