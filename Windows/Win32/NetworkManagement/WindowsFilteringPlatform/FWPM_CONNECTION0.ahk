#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_CIPHER_ALGORITHM0.ahk
#Include .\IKEEXT_INTEGRITY_ALGORITHM0.ahk
#Include .\IKEEXT_PROPOSAL0.ahk
#Include .\IKEEXT_CREDENTIAL2.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Stores the state associated with a connection object.
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_connection0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_CONNECTION0 extends Win32Struct
{
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
     * @type {Integer}
     */
    ipVersion {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    localV4Address {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    localV6Address{
        get {
            if(!this.HasProp("__localV6AddressProxyArray"))
                this.__localV6AddressProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__localV6AddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    remoteV4Address {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<Byte>}
     */
    remoteV6Address{
        get {
            if(!this.HasProp("__remoteV6AddressProxyArray"))
                this.__remoteV6AddressProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
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
     * @type {Integer}
     */
    ipsecTrafficModeType {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Type: [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type)</b>
     * 
     * The type of keying module.
     * @type {Integer}
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
    mmCrypto{
        get {
            if(!this.HasProp("__mmCrypto"))
                this.__mmCrypto := IKEEXT_PROPOSAL0(this.ptr + 64)
            return this.__mmCrypto
        }
    }

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Main mode credential information.
     * @type {IKEEXT_CREDENTIAL2}
     */
    mmPeer{
        get {
            if(!this.HasProp("__mmPeer"))
                this.__mmPeer := IKEEXT_CREDENTIAL2(this.ptr + 96)
            return this.__mmPeer
        }
    }

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Extended mode credential information.
     * @type {IKEEXT_CREDENTIAL2}
     */
    emPeer{
        get {
            if(!this.HasProp("__emPeer"))
                this.__emPeer := IKEEXT_CREDENTIAL2(this.ptr + 112)
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
    startSysTime{
        get {
            if(!this.HasProp("__startSysTime"))
                this.__startSysTime := FILETIME(this.ptr + 152)
            return this.__startSysTime
        }
    }
}
