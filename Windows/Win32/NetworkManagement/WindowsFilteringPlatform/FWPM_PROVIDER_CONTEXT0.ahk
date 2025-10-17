#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FWPM_DISPLAY_DATA0.ahk
#Include .\FWP_BYTE_BLOB.ahk

/**
 * Stores the state associated with a provider context.
 * @remarks
 * 
  * The first seven elements of the union are information supplied when adding objects.
  * 
  * The last element is additional information returned when getting/enumerating objects.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//fwpmtypes/ns-fwpmtypes-fwpm_provider_context0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_PROVIDER_CONTEXT0 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Uniquely identifies the provider context. If the GUID is zero-initialized in the call to [FwpmProviderContextAdd0](../fwpmu/nf-fwpmu-fwpmprovidercontextadd0.md), Base Filtering Engine (BFE) will generate one.
     * @type {Pointer<Guid>}
     */
    providerContextKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Allows provider contexts to be annotated in a human-readable form. The [FWPM_DISPLAY_DATA0](../fwptypes/ns-fwptypes-fwpm_display_data0.md) structure is required.
     * @type {FWPM_DISPLAY_DATA0}
     */
    displayData{
        get {
            if(!this.HasProp("__displayData"))
                this.__displayData := FWPM_DISPLAY_DATA0(8, this)
            return this.__displayData
        }
    }

    /**
     * Possible values:
     * 
     * | Provider context flag | Meaning |
     * | ----- | ------- |
     * | FWPM_PROVIDER_CONTEXT_FLAG_PERSISTENT | The object is persistent, that is, it survives across BFE stop/start. |
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * GUID of the policy provider that manages this object.
     * @type {Pointer<Guid>}
     */
    providerKey {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An [FWP_BYTE_BLOB](../fwptypes/ns-fwptypes-fwp_byte_blob.md) structure that contains optional provider-specific data that allows providers to store additional context info with the object.
     * @type {FWP_BYTE_BLOB}
     */
    providerData{
        get {
            if(!this.HasProp("__providerData"))
                this.__providerData := FWP_BYTE_BLOB(40, this)
            return this.__providerData
        }
    }

    /**
     * A [FWPM_PROVIDER_CONTEXT_TYPE](ne-fwpmtypes-fwpm_provider_context_type.md) value specifying the type of provider context..
     * @type {Integer}
     */
    type {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {Pointer<IPSEC_KEYING_POLICY0>}
     */
    keyingPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY0>}
     */
    ikeQmTransportPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY0>}
     */
    ikeQmTunnelPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TRANSPORT_POLICY0>}
     */
    authipQmTransportPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IPSEC_TUNNEL_POLICY0>}
     */
    authipQmTunnelPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY0>}
     */
    ikeMmPolicy {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<IKEEXT_POLICY0>}
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
     * LUID identifying the context.  This is the context value stored in the **FWPS_FILTER0** structure for filters that reference a provider context. The **FWPS_FILTER0** structure is documented in the WDK.
     * @type {Integer}
     */
    providerContextId {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
