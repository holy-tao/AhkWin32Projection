#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_DOSP_OPTIONS0.ahk" { IPSEC_DOSP_OPTIONS0 }
#Import ".\FWPM_PROVIDER_CONTEXT_TYPE.ahk" { FWPM_PROVIDER_CONTEXT_TYPE }
#Import ".\FWPM_CLASSIFY_OPTIONS0.ahk" { FWPM_CLASSIFY_OPTIONS0 }
#Import ".\FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0.ahk" { FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_POLICY2.ahk" { IKEEXT_POLICY2 }
#Import ".\FWPM_DISPLAY_DATA0.ahk" { FWPM_DISPLAY_DATA0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TRANSPORT_POLICY2.ahk" { IPSEC_TRANSPORT_POLICY2 }
#Import ".\IPSEC_TUNNEL_POLICY3.ahk" { IPSEC_TUNNEL_POLICY3 }
#Import ".\IPSEC_KEYING_POLICY1.ahk" { IPSEC_KEYING_POLICY1 }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_PROVIDER_CONTEXT3 {
    #StructPack 8

    providerContextKey : Guid

    displayData : FWPM_DISPLAY_DATA0

    flags : UInt32

    providerKey : Guid.Ptr

    providerData : FWP_BYTE_BLOB

    type : FWPM_PROVIDER_CONTEXT_TYPE

    keyingPolicy : IPSEC_KEYING_POLICY1.Ptr

    providerContextId : Int64

    static __New() {
        DefineProp(this.Prototype, 'ikeQmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeQmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY3.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authipQmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authipQmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY3.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeMmPolicy', { type: IKEEXT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'authIpMmPolicy', { type: IKEEXT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'dataBuffer', { type: FWP_BYTE_BLOB.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'classifyOptions', { type: FWPM_CLASSIFY_OPTIONS0.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2QmTunnelPolicy', { type: IPSEC_TUNNEL_POLICY3.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2QmTransportPolicy', { type: IPSEC_TRANSPORT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'ikeV2MmPolicy', { type: IKEEXT_POLICY2.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'idpOptions', { type: IPSEC_DOSP_OPTIONS0.Ptr, offset: 72 })
        DefineProp(this.Prototype, 'networkConnectionPolicy', { type: FWPM_NETWORK_CONNECTION_POLICY_SETTINGS0.Ptr, offset: 72 })
        this.DeleteProp("__New")
    }
}
