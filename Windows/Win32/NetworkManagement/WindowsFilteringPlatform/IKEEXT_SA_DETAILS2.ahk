#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_TRAFFIC0.ahk
#Include .\IKEEXT_CIPHER_ALGORITHM0.ahk
#Include .\IKEEXT_INTEGRITY_ALGORITHM0.ahk
#Include .\IKEEXT_PROPOSAL0.ahk
#Include .\IKEEXT_COOKIE_PAIR0.ahk
#Include .\IKEEXT_CREDENTIALS2.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Is used to store information returned when enumerating IKE, AuthIP, and IKEv2 security associations (SAs). (IKEEXT_SA_DETAILS2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_sa_details2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_SA_DETAILS2 extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: <b>UINT64</b>
     * 
     * LUID identifying the security association.
     * @type {Integer}
     */
    saId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type)</b>
     * 
     * Key module type.
     * @type {Integer}
     */
    keyModuleType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     *  The IP version.
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Pointer<TypeHandle>}
     */
    Anonymous {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [IKEEXT_TRAFFIC0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_traffic0)</b>
     * 
     * The traffic corresponding to this IKE SA.
     * @type {IKEEXT_TRAFFIC0}
     */
    ikeTraffic{
        get {
            if(!this.HasProp("__ikeTraffic"))
                this.__ikeTraffic := IKEEXT_TRAFFIC0(this.ptr + 24)
            return this.__ikeTraffic
        }
    }

    /**
     * Type: [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0)</b>
     * 
     * The main mode proposal corresponding to this IKE SA.
     * @type {IKEEXT_PROPOSAL0}
     */
    ikeProposal{
        get {
            if(!this.HasProp("__ikeProposal"))
                this.__ikeProposal := IKEEXT_PROPOSAL0(this.ptr + 48)
            return this.__ikeProposal
        }
    }

    /**
     * Type: [IKEEXT_COOKIE_PAIR0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cookie_pair0)</b>
     * 
     * The SA cookies.
     * @type {IKEEXT_COOKIE_PAIR0}
     */
    cookiePair{
        get {
            if(!this.HasProp("__cookiePair"))
                this.__cookiePair := IKEEXT_COOKIE_PAIR0(this.ptr + 80)
            return this.__cookiePair
        }
    }

    /**
     * Type: [IKEEXT_CREDENTIALS2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credentials2)</b>
     * 
     * Credentials information for the SA.
     * @type {IKEEXT_CREDENTIALS2}
     */
    ikeCredentials{
        get {
            if(!this.HasProp("__ikeCredentials"))
                this.__ikeCredentials := IKEEXT_CREDENTIALS2(this.ptr + 96)
            return this.__ikeCredentials
        }
    }

    /**
     * Type: <b>GUID</b>
     * 
     * GUID of the main mode policy provider context corresponding to this SA.
     * @type {Pointer<Guid>}
     */
    ikePolicyKey {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * ID/Handle to virtual interface tunneling state. Applicable only to IKEv2.
     * @type {Integer}
     */
    virtualIfTunnelId {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob)</b>
     * 
     * Key derived from authentications to allow external applications to cryptographically bind
     *    their exchanges with this SA.
     * @type {FWP_BYTE_BLOB}
     */
    correlationKey{
        get {
            if(!this.HasProp("__correlationKey"))
                this.__correlationKey := FWP_BYTE_BLOB(this.ptr + 128)
            return this.__correlationKey
        }
    }
}
