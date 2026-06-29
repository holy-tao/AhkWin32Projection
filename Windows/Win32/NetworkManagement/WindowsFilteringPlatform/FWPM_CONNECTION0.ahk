#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION1 }
#Import ".\IKEEXT_NAME_CREDENTIAL0.ahk" { IKEEXT_NAME_CREDENTIAL0 }
#Import ".\IKEEXT_INTEGRITY_TYPE.ahk" { IKEEXT_INTEGRITY_TYPE }
#Import ".\IKEEXT_CERTIFICATE_CREDENTIAL1.ahk" { IKEEXT_CERTIFICATE_CREDENTIAL1 }
#Import ".\IKEEXT_DH_GROUP.ahk" { IKEEXT_DH_GROUP }
#Import ".\IKEEXT_KEY_MODULE_TYPE.ahk" { IKEEXT_KEY_MODULE_TYPE }
#Import ".\IKEEXT_INTEGRITY_ALGORITHM0.ahk" { IKEEXT_INTEGRITY_ALGORITHM0 }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_CIPHER_TYPE.ahk" { IKEEXT_CIPHER_TYPE }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IKEEXT_CIPHER_ALGORITHM0.ahk" { IKEEXT_CIPHER_ALGORITHM0 }
#Import ".\IKEEXT_CREDENTIAL2.ahk" { IKEEXT_CREDENTIAL2 }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\IKEEXT_PROPOSAL0.ahk" { IKEEXT_PROPOSAL0 }

/**
 * Stores the state associated with a connection object.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_CONNECTION0 {
    #StructPack 8

    /**
     * Type: <b>UINT64</b>
     * 
     * The run-time identifier for the connection.
     */
    connectionId : Int64

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     * The IP version being used.
     */
    ipVersion : FWP_IP_VERSION

    localV4Address : UInt32

    remoteV4Address : UInt32

    /**
     * Type: <b>GUID*</b>
     * 
     * Uniquely identifies the provider associated with this connection.
     */
    providerKey : Guid.Ptr

    /**
     * Type: [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type)</b>
     * 
     * The type of IPsec traffic.
     */
    ipsecTrafficModeType : IPSEC_TRAFFIC_TYPE

    /**
     * Type: [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type)</b>
     * 
     * The type of keying module.
     */
    keyModuleType : IKEEXT_KEY_MODULE_TYPE

    /**
     * Type: [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0)</b>
     * 
     * An IKE/AuthIP main mode proposal.
     */
    mmCrypto : IKEEXT_PROPOSAL0

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Main mode credential information.
     */
    mmPeer : IKEEXT_CREDENTIAL2

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Extended mode credential information.
     */
    emPeer : IKEEXT_CREDENTIAL2

    /**
     * Type: <b>UINT64</b>
     * 
     * The total number of incoming bytes transferred by the connection.
     */
    bytesTransferredIn : Int64

    /**
     * Type: <b>UINT64</b>
     * 
     * The total number of outgoing bytes transferred by the connection.
     */
    bytesTransferredOut : Int64

    /**
     * Type: <b>UINT64</b>
     * 
     * The total number of bytes (incoming and outgoing) transferred by the connection.
     */
    bytesTransferredTotal : Int64

    /**
     * Type: <b>FILETIME</b>
     * 
     * Time that the connection was created.
     */
    startSysTime : FILETIME

    static __New() {
        DefineProp(this.Prototype, 'localV6Address', { type: Int8[16], offset: 12 })
        DefineProp(this.Prototype, 'remoteV6Address', { type: Int8[16], offset: 28 })
        this.DeleteProp("__New")
    }
}
