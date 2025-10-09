#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_TRAFFIC0.ahk
#Include .\IKEEXT_CIPHER_ALGORITHM0.ahk
#Include .\IKEEXT_INTEGRITY_ALGORITHM0.ahk
#Include .\IKEEXT_PROPOSAL0.ahk
#Include .\IKEEXT_COOKIE_PAIR0.ahk
#Include .\IKEEXT_CREDENTIALS0.ahk

/**
 * Is used to store information returned when enumerating IKE, AuthIP, or IKEv2 security associations (SAs).
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_sa_details0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_SA_DETAILS0 extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * LUID identifying the security association.
     * @type {Integer}
     */
    saId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Key module type. 
     * 
     * See [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type) for more information.
     * @type {Integer}
     */
    keyModuleType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * IP version specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
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
     * The traffic corresponding to this IKE SA specified by [IKEEXT_TRAFFIC0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_traffic0).
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
     * The main mode proposal corresponding to this IKE SA specified by [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0).
     * @type {IKEEXT_PROPOSAL0}
     */
    ikeProposal{
        get {
            if(!this.HasProp("__ikeProposal"))
                this.__ikeProposal := IKEEXT_PROPOSAL0(this.ptr + 72)
            return this.__ikeProposal
        }
    }

    /**
     * SA cookies specified by [IKEEXT_COOKIE_PAIR0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cookie_pair0).
     * @type {IKEEXT_COOKIE_PAIR0}
     */
    cookiePair{
        get {
            if(!this.HasProp("__cookiePair"))
                this.__cookiePair := IKEEXT_COOKIE_PAIR0(this.ptr + 104)
            return this.__cookiePair
        }
    }

    /**
     * Credentials information for the SA specified by [IKEEXT_CREDENTIALS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credentials0).
     * @type {IKEEXT_CREDENTIALS0}
     */
    ikeCredentials{
        get {
            if(!this.HasProp("__ikeCredentials"))
                this.__ikeCredentials := IKEEXT_CREDENTIALS0(this.ptr + 120)
            return this.__ikeCredentials
        }
    }

    /**
     * GUID of the main mode policy provider context corresponding to this SA.
     * @type {Pointer<Guid>}
     */
    ikePolicyKey {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * ID/Handle to virtual interface tunneling state.
     * 
     * Applicable only to IKEv2.
     * 
     * Available only on Windows 7, Windows Server 2008 R2, and later.
     * @type {Integer}
     */
    virtualIfTunnelId {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }
}
