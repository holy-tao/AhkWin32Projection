#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWPM_NET_EVENT_CAPABILITY_ALLOW0.ahk" { FWPM_NET_EVENT_CAPABILITY_ALLOW0 }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWPM_NET_EVENT_IKEEXT_MM_FAILURE1.ahk" { FWPM_NET_EVENT_IKEEXT_MM_FAILURE1 }
#Import ".\FWPM_NET_EVENT_CLASSIFY_DROP2.ahk" { FWPM_NET_EVENT_CLASSIFY_DROP2 }
#Import ".\FWPM_NET_EVENT_HEADER3.ahk" { FWPM_NET_EVENT_HEADER3 }
#Import ".\FWPM_NET_EVENT_CAPABILITY_DROP0.ahk" { FWPM_NET_EVENT_CAPABILITY_DROP0 }
#Import ".\FWPM_NET_EVENT_IPSEC_KERNEL_DROP0.ahk" { FWPM_NET_EVENT_IPSEC_KERNEL_DROP0 }
#Import ".\FWPM_NET_EVENT_IPSEC_DOSP_DROP0.ahk" { FWPM_NET_EVENT_IPSEC_DOSP_DROP0 }
#Import ".\FWPM_NET_EVENT_CLASSIFY_DROP_MAC0.ahk" { FWPM_NET_EVENT_CLASSIFY_DROP_MAC0 }
#Import ".\FWPM_NET_EVENT_CLASSIFY_ALLOW0.ahk" { FWPM_NET_EVENT_CLASSIFY_ALLOW0 }
#Import ".\FWPM_NET_EVENT_IKEEXT_QM_FAILURE0.ahk" { FWPM_NET_EVENT_IKEEXT_QM_FAILURE0 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWPM_NET_EVENT_IKEEXT_EM_FAILURE1.ahk" { FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWP_AF.ahk" { FWP_AF }
#Import ".\FWPM_NET_EVENT_TYPE.ahk" { FWPM_NET_EVENT_TYPE }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information about all event types. (FWPM_NET_EVENT3)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event3
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT3 {
    #StructPack 8

    /**
     * Information common to all events.
     */
    header : FWPM_NET_EVENT_HEADER3

    /**
     * The type of event.
     */
    type : FWPM_NET_EVENT_TYPE

    ikeMmFailure : FWPM_NET_EVENT_IKEEXT_MM_FAILURE1.Ptr

    static __New() {
        DefineProp(this.Prototype, 'ikeQmFailure', { type: FWPM_NET_EVENT_IKEEXT_QM_FAILURE0.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'ikeEmFailure', { type: FWPM_NET_EVENT_IKEEXT_EM_FAILURE1.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'classifyDrop', { type: FWPM_NET_EVENT_CLASSIFY_DROP2.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'ipsecDrop', { type: FWPM_NET_EVENT_IPSEC_KERNEL_DROP0.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'idpDrop', { type: FWPM_NET_EVENT_IPSEC_DOSP_DROP0.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'classifyAllow', { type: FWPM_NET_EVENT_CLASSIFY_ALLOW0.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'capabilityDrop', { type: FWPM_NET_EVENT_CAPABILITY_DROP0.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'capabilityAllow', { type: FWPM_NET_EVENT_CAPABILITY_ALLOW0.Ptr, offset: 144 })
        DefineProp(this.Prototype, 'classifyDropMac', { type: FWPM_NET_EVENT_CLASSIFY_DROP_MAC0.Ptr, offset: 144 })
        this.DeleteProp("__New")
    }
}
