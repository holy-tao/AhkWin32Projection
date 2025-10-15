#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The PEER_GROUP_PROPERTIES structure contains data about the membership policy of a peer group.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_group_properties
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_PROPERTIES extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_property_flags">PEER_GROUP_PROPERTY_FLAGS</a> flags that describe the behavior of a peer group. The default value is zero (0), which indicates that flags are not set.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the name of the   Peer Name Resolution Protocol (PNRP) cloud that  a peer group participates in. The default value is "global", if this member is <b>NULL</b>.
     * @type {PWSTR}
     */
    pwzCloud{
        get {
            if(!this.HasProp("__pwzCloud"))
                this.__pwzCloud := PWSTR(this.ptr + 8)
            return this.__pwzCloud
        }
    }

    /**
     * Specifies the classifier used to  identify the authority of a peer group peer name for registration or resolution within a PNRP cloud. The maximum size of this field is 149 Unicode characters. This member can be <b>NULL</b>.
     * @type {PWSTR}
     */
    pwzClassifier{
        get {
            if(!this.HasProp("__pwzClassifier"))
                this.__pwzClassifier := PWSTR(this.ptr + 16)
            return this.__pwzClassifier
        }
    }

    /**
     * Specifies the name of a peer group that is registered with the PNRP service. The maximum size of this field is 137 Unicode characters.
     * @type {PWSTR}
     */
    pwzGroupPeerName{
        get {
            if(!this.HasProp("__pwzGroupPeerName"))
                this.__pwzGroupPeerName := PWSTR(this.ptr + 24)
            return this.__pwzGroupPeerName
        }
    }

    /**
     * Specifies the  peer name associated with the Peer group creator. The maximum size of this field is 137 Unicode characters. If this structure member is <b>NULL</b>, the implementation uses the identity obtained from <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peeridentitygetdefault">PeerIdentityGetDefault</a>.
     * @type {PWSTR}
     */
    pwzCreatorPeerName{
        get {
            if(!this.HasProp("__pwzCreatorPeerName"))
                this.__pwzCreatorPeerName := PWSTR(this.ptr + 32)
            return this.__pwzCreatorPeerName
        }
    }

    /**
     * Specifies the friendly (display) name of a peer group. The maximum size of this field is 255 characters.
     * @type {PWSTR}
     */
    pwzFriendlyName{
        get {
            if(!this.HasProp("__pwzFriendlyName"))
                this.__pwzFriendlyName := PWSTR(this.ptr + 40)
            return this.__pwzFriendlyName
        }
    }

    /**
     * Contains a comment used to describe a peer group. The maximum size of this field is 255 characters.
     * @type {PWSTR}
     */
    pwzComment{
        get {
            if(!this.HasProp("__pwzComment"))
                this.__pwzComment := PWSTR(this.ptr + 48)
            return this.__pwzComment
        }
    }

    /**
     * Specifies the lifetime, in seconds, of peer group member data (<a href="https://docs.microsoft.com/windows/desktop/api/p2p/ns-p2p-peer_member">PEER_MEMBER</a>). The minimum value for this field is 8 hours, and the maximum is 10 years. The default value is 2,419,200 seconds, or 28 days.
     * 
     * If this value is set to zero (0), member data has the maximum allowable lifetime, which is the time remaining in the lifetime of the administrator who issues the credentials for a member.
     * @type {Integer}
     */
    ulMemberDataLifetime {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the lifetime, in seconds, of presence information published to a peer group. The default value is 300 seconds. Do not set the value  of   <b>ulPresenceLifetime</b> to less than 300  seconds. If this member is set to less than the 300–second default value, then undefined behavior can occur.
     * @type {Integer}
     */
    ulPresenceLifetime {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * <b>Windows Vista or later.</b> Logical OR of <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_authentication_scheme">PEER_GROUP_AUTHENTICATION_SCHEME</a> enumeration values that indicate the types of authentication supported by the peer group.
     * @type {Integer}
     */
    dwAuthenticationSchemes {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * <b>Windows Vista or later.</b> Pointer to a Unicode string that contains the password used to authenticate peers attempting to join the peer group.
     * @type {PWSTR}
     */
    pwzGroupPassword{
        get {
            if(!this.HasProp("__pwzGroupPassword"))
                this.__pwzGroupPassword := PWSTR(this.ptr + 72)
            return this.__pwzGroupPassword
        }
    }

    /**
     * <b>Windows Vista or later.</b> GUID value that indicates the peer group role for which the password is required for authentication.
     * @deprecated
     * @type {Pointer<Guid>}
     */
    groupPasswordRole {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
