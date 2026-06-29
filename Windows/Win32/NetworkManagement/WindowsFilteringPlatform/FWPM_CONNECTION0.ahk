#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_CIPHER_TYPE.ahk
#Include .\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk
#Include .\IKEEXT_NAME_CREDENTIAL0.ahk
#Include .\IKEEXT_CERTIFICATE_CREDENTIAL1.ahk
#Include .\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk
#Include .\FWP_IP_VERSION.ahk
#Include .\IKEEXT_CREDENTIAL2.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\IKEEXT_KEY_MODULE_TYPE.ahk
#Include .\IKEEXT_INTEGRITY_ALGORITHM0.ahk
#Include .\IKEEXT_PROPOSAL0.ahk
#Include .\IPSEC_TRAFFIC_TYPE.ahk
#Include .\IKEEXT_CIPHER_ALGORITHM0.ahk
#Include .\IKEEXT_DH_GROUP.ahk
#Include .\IKEEXT_INTEGRITY_TYPE.ahk
#Include .\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk

/**
 * Stores the state associated with a connection object.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_CONNECTION0 extends Win32Struct {
    static sizeof => 160

    static packingSize => 8

    /**
     * Type: <b>UINT64</b>
     * 
     * The run-time identifier for the connection.
     * @type {Integer}
     */
    connectionId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version)</b>
     * 
     * The IP version being used.
     * @type {FWP_IP_VERSION}
     */
    ipVersion {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    localV4Address {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    localV6Address {
        get {
            if(!this.HasProp("__localV6AddressProxyArray"))
                this.__localV6AddressProxyArray := Win32FixedArray(this.ptr + 12, 16, Primitive, "char")
            return this.__localV6AddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    remoteV4Address {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Integer>}
     */
    remoteV6Address {
        get {
            if(!this.HasProp("__remoteV6AddressProxyArray"))
                this.__remoteV6AddressProxyArray := Win32FixedArray(this.ptr + 28, 16, Primitive, "char")
            return this.__remoteV6AddressProxyArray
        }
    }

    /**
     * Type: <b>GUID*</b>
     * 
     * Uniquely identifies the provider associated with this connection.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type)</b>
     * 
     * The type of IPsec traffic.
     * @type {IPSEC_TRAFFIC_TYPE}
     */
    ipsecTrafficModeType {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Type: [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type)</b>
     * 
     * The type of keying module.
     * @type {IKEEXT_KEY_MODULE_TYPE}
     */
    keyModuleType {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Type: [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0)</b>
     * 
     * An IKE/AuthIP main mode proposal.
     * @type {IKEEXT_PROPOSAL0}
     */
    mmCrypto {
        get {
            if(!this.HasProp("__mmCrypto"))
                this.__mmCrypto := IKEEXT_PROPOSAL0(64, this)
            return this.__mmCrypto
        }
    }

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Main mode credential information.
     * @type {IKEEXT_CREDENTIAL2}
     */
    mmPeer {
        get {
            if(!this.HasProp("__mmPeer"))
                this.__mmPeer := IKEEXT_CREDENTIAL2(96, this)
            return this.__mmPeer
        }
    }

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Extended mode credential information.
     * @type {IKEEXT_CREDENTIAL2}
     */
    emPeer {
        get {
            if(!this.HasProp("__emPeer"))
                this.__emPeer := IKEEXT_CREDENTIAL2(112, this)
            return this.__emPeer
        }
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * The total number of incoming bytes transferred by the connection.
     * @type {Integer}
     */
    bytesTransferredIn {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * The total number of outgoing bytes transferred by the connection.
     * @type {Integer}
     */
    bytesTransferredOut {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: <b>UINT64</b>
     * 
     * The total number of bytes (incoming and outgoing) transferred by the connection.
     * @type {Integer}
     */
    bytesTransferredTotal {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Type: <b>FILETIME</b>
     * 
     * Time that the connection was created.
     * @type {FILETIME}
     */
    startSysTime {
        get {
            if(!this.HasProp("__startSysTime"))
                this.__startSysTime := FILETIME(152, this)
            return this.__startSysTime
        }
    }
}
