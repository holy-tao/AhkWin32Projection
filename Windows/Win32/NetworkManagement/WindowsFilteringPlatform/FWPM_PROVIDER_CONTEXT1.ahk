#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_DOSP_OPTIONS0.ahk" { IPSEC_DOSP_OPTIONS0 }
#Import ".\FWPM_PROVIDER_CONTEXT_TYPE.ahk" { FWPM_PROVIDER_CONTEXT_TYPE }
#Import ".\FWPM_CLASSIFY_OPTIONS0.ahk" { FWPM_CLASSIFY_OPTIONS0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IPSEC_KEYING_POLICY0.ahk" { IPSEC_KEYING_POLICY0 }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import ".\IKEEXT_POLICY1.ahk" { IKEEXT_POLICY1 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TUNNEL_POLICY1.ahk" { IPSEC_TUNNEL_POLICY1 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPSEC_TRANSPORT_POLICY1.ahk" { IPSEC_TRANSPORT_POLICY1 }

/**
 * Stores the state associated with a provider context. (FWPM_PROVIDER_CONTEXT1)
 * @remarks
 * The first seven elements of the union are information supplied when adding objects.
 * 
 * The last element is additional information returned when getting/enumerating objects.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_CONTEXT1 {
    #StructPack 8

    /**
     * Uniquely identifies the provider context. If the GUID is zero-initialized in the call to [FwpmProviderContextAdd1](../fwpmu/nf-fwpmu-fwpmprovidercontextadd1.md), Base Filtering Engine (BFE) will generate one.
     */
    providerContextKey : Guid

    /**
     * Allows provider contexts to be annotated in a human-readable form. The [FWPM_DISPLAY_DATA0](../fwptypes/ns-fwptypes-fwpm_display_data0.md) structure is required.
     */
    displayData : FWPM_DISPLAY_DATA0

    /**
     * Possible values:
     * 
     * | Provider context flag | Meaning |
     * | ----- | ------- |
     * | FWPM_PROVIDER_CONTEXT_FLAG_PERSISTENT | The object is persistent, that is, it survives across BFE stop/start. |
     */
    flags : UInt32

    /**
     * GUID of the policy provider that manages this object.
     */
    providerKey : Guid.Ptr

    /**
     * An [FWP_BYTE_BLOB](../fwptypes/ns-fwptypes-fwp_byte_blob.md) structure that contains optional provider-specific data that allows providers to store additional context info with the object.
     */
    providerData : FWP_BYTE_BLOB

    /**
     * A [FWPM_PROVIDER_CONTEXT_TYPE](ne-fwpmtypes-fwpm_provider_context_type.md) value specifying the type of provider context..
     */
    type : FWPM_PROVIDER_CONTEXT_TYPE

    keyingPolicy : IPSEC_KEYING_POLICY0.Ptr

    /**
     * LUID identifying the context.  This is the context value stored in the **FWPS_FILTER1** structure for filters that reference a provider context. The **FWPS_FILTER1** structure is documented in the WDK.
     */
    providerContextId : Int64

    static __New() {
        DefineProp(this.Prototype, 'ikeQmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeQmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authipQmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authipQmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeMmPolicy', { type: IKEEXT_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authIpMmPolicy', { type: IKEEXT_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'dataBuffer', { type: FWP_BYTE_BLOB.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'classifyOptions', { type: FWPM_CLASSIFY_OPTIONS0.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2QmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2MmPolicy', { type: IKEEXT_POLICY1.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'idpOptions', { type: IPSEC_DOSP_OPTIONS0.Ptr, offset: 72 })
        this.DeleteProp("__New")
    }
}
