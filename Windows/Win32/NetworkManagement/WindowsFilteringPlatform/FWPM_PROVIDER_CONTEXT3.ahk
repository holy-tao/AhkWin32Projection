#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_PROVIDER_CONTEXT3 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    providerContextKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {FWPM_DISPLAY_DATA0}
     */
    displayData{
        get {
            if(!this.HasProp("__displayData"))
                this.__displayData := FWPM_DISPLAY_DATA0(this.ptr + 8)
            return this.__displayData
        }
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {FWP_BYTE_BLOB}
     */
    providerData{
        get {
            if(!this.HasProp("__providerData"))
                this.__providerData := FWP_BYTE_BLOB(this.ptr + 40)
            return this.__providerData
        }
    }

    /**
     * @type {Integer}
     */
    type {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Pointer<IPSEC_KEYING_POLICY1>}
     */
    keyingPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY2>}
     */
    ikeQmTransportPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY3>}
     */
    ikeQmTunnelPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY2>}
     */
    authipQmTransportPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY3>}
     */
    authipQmTunnelPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY2>}
     */
    ikeMmPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY2>}
     */
    authIpMmPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<FWP_BYTE_BLOB>}
     */
    dataBuffer {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<FWPM_CLASSIFY_OPTIONS0>}
     */
    classifyOptions {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY3>}
     */
    ikeV2QmTunnelPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY2>}
     */
    ikeV2QmTransportPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY2>}
     */
    ikeV2MmPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_DOSP_OPTIONS0>}
     */
    idpOptions {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0>}
     */
    networkConnectionPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    providerContextId {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
