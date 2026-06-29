#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_DOSP_OPTIONS0.ahk" { IPSEC_DOSP_OPTIONS0 }
#Import ".\FWPM_PROVIDER_CONTEXT_TYPE.ahk" { FWPM_PROVIDER_CONTEXT_TYPE }
#Import ".\FWPM_CLASSIFY_OPTIONS0.ahk" { FWPM_CLASSIFY_OPTIONS0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_POLICY2.ahk" { IKEEXT_POLICY2 }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TUNNEL_POLICY2.ahk" { IPSEC_TUNNEL_POLICY2 }
#Import ".\IPSEC_TRANSPORT_POLICY2.ahk" { IPSEC_TRANSPORT_POLICY2 }
#Import ".\IPSEC_KEYING_POLICY1.ahk" { IPSEC_KEYING_POLICY1 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Stores the state associated with a provider context. (FWPM_PROVIDER_CONTEXT2)
 * @remarks
 * The first seven elements of the union are information supplied when adding objects.
 * 
 * The last element is additional information returned when getting/enumerating objects.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_CONTEXT2 {
    #StructPack 8

    /**
     * Type: **GUID**
     * 
     * Uniquely identifies the provider context. If the GUID is zero-initialized in the call to [FwpmProviderContextAdd2](../fwpmu/nf-fwpmu-fwpmprovidercontextadd2.md), Base Filtering Engine (BFE) will generate one.
     */
    providerContextKey : Guid

    /**
     * Type: **[FWPM_DISPLAY_DATA0](../fwptypes/ns-fwptypes-fwpm_display_data0.md)**
     * 
     * Allows provider contexts to be annotated in a human-readable form. The [FWPM_DISPLAY_DATA0](../fwptypes/ns-fwptypes-fwpm_display_data0.md) structure is required.
     */
    displayData : FWPM_DISPLAY_DATA0

    /**
     * Type: **UINT32**
     * 
     * Possible values:
     * 
     * | Provider context flag | Meaning |
     * | ----- | ------- |
     * | FWPM_PROVIDER_CONTEXT_FLAG_PERSISTENT | The object is persistent, that is, it survives across BFE stop/start. |
     * | FWPM_PROVIDER_CONTEXT_FLAG_DOWNLEVEL | Reserved for internal use. |
     */
    flags : UInt32

    /**
     * Type: **GUID***
     * 
     * GUID of the policy provider that manages this object.
     */
    providerKey : Guid.Ptr

    /**
     * Type: **[FWP_BYTE_BLOB](../fwptypes/ns-fwptypes-fwp_byte_blob.md)**
     * 
     * Optional provider-specific data that allows providers to store additional context info with the object.
     */
    providerData : FWP_BYTE_BLOB

    /**
     * Type: **[FWPM_PROVIDER_CONTEXT_TYPE](ne-fwpmtypes-fwpm_provider_context_type.md)**
     * 
     * The type of provider context.
     */
    type : FWPM_PROVIDER_CONTEXT_TYPE

    keyingPolicy : IPSEC_KEYING_POLICY1.Ptr

    /**
     * Type: **UINT64**
     * 
     * LUID identifying the context.  This is the context value stored in the **FWPS_FILTER1** structure for filters that reference a provider context. The **FWPS_FILTER1** structure is documented in the WDK.
     */
    providerContextId : Int64

    static __New() {
        DefineProp(this.Prototype, 'ikeQmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeQmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authipQmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authipQmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeMmPolicy', { type: IKEEXT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authIpMmPolicy', { type: IKEEXT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'dataBuffer', { type: FWP_BYTE_BLOB.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'classifyOptions', { type: FWPM_CLASSIFY_OPTIONS0.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2QmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2QmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2MmPolicy', { type: IKEEXT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'idpOptions', { type: IPSEC_DOSP_OPTIONS0.Ptr, offset: 72 })
        this.DeleteProp("__New")
    }
}
