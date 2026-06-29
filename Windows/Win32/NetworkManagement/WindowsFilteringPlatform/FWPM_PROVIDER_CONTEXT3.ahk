#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IPSEC_DOSP_OPTIONS0.ahk
#Include .\IPSEC_KEYING_POLICY1.ahk
#Include .\FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\FWPM_PROVIDER_CONTEXT_TYPE.ahk
#Include .\FWPM_CLASSIFY_OPTIONS0.ahk
#Include .\IKEEXT_POLICY2.ahk
#Include .\IPSEC_TUNNEL_POLICY3.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include .\FWP_BYTE_BLOB.ahk
#Include .\IPSEC_TRANSPORT_POLICY2.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_PROVIDER_CONTEXT3 extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Guid}
     */
    providerContextKey {
        get {
            if(!this.HasProp("__providerContextKey"))
                this.__providerContextKey := Guid(0, this)
            return this.__providerContextKey
        }
    }

    /**
     * @type {FWPM_DISPLAY_DATA0}
     */
    displayData {
        get {
            if(!this.HasProp("__displayData"))
                this.__displayData := FWPM_DISPLAY_DATA0(16, this)
            return this.__displayData
        }
    }

    /**
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {FWP_BYTE_BLOB}
     */
    providerData {
        get {
            if(!this.HasProp("__providerData"))
                this.__providerData := FWP_BYTE_BLOB(48, this)
            return this.__providerData
        }
    }

    /**
     * @type {FWPM_PROVIDER_CONTEXT_TYPE}
     */
    type {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_KEYING_POLICY1>}
     */
    keyingPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY2>}
     */
    ikeQmTransportPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY3>}
     */
    ikeQmTunnelPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY2>}
     */
    authipQmTransportPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY3>}
     */
    authipQmTunnelPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY2>}
     */
    ikeMmPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY2>}
     */
    authIpMmPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<FWP_BYTE_BLOB>}
     */
    dataBuffer {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<FWPM_CLASSIFY_OPTIONS0>}
     */
    classifyOptions {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY3>}
     */
    ikeV2QmTunnelPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY2>}
     */
    ikeV2QmTransportPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY2>}
     */
    ikeV2MmPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<IPSEC_DOSP_OPTIONS0>}
     */
    idpOptions {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0>}
     */
    networkConnectionPolicy {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    providerContextId {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
