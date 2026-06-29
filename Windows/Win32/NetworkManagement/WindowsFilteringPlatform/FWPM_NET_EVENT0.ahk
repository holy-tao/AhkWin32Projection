#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_NET_EVENT_CLASSIFY_DROP0.ahk" { FWPM_NET_EVENT_CLASSIFY_DROP0 }
#Import ".\FWPM_NET_EVENT_IKEEXT_EM_FAILURE0.ahk" { FWPM_NET_EVENT_IKEEXT_EM_FAILURE0 }
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWPM_NET_EVENT_HEADER0.ahk" { FWPM_NET_EVENT_HEADER0 }
#Import ".\FWPM_NET_EVENT_IPSEC_KERNEL_DROP0.ahk" { FWPM_NET_EVENT_IPSEC_KERNEL_DROP0 }
#Import ".\FWPM_NET_EVENT_IKEEXT_MM_FAILURE0.ahk" { FWPM_NET_EVENT_IKEEXT_MM_FAILURE0 }
#Import ".\FWPM_NET_EVENT_IPSEC_DOSP_DROP0.ahk" { FWPM_NET_EVENT_IPSEC_DOSP_DROP0 }
#Import ".\FWPM_NET_EVENT_IKEEXT_QM_FAILURE0.ahk" { FWPM_NET_EVENT_IKEEXT_QM_FAILURE0 }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\FWPM_NET_EVENT_TYPE.ahk" { FWPM_NET_EVENT_TYPE }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information about all event types. (FWPM_NET_EVENT0)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT0 {
    #StructPack 8

    /**
     * A [FWPM_NET_EVENT_HEADER0](ns-fwpmtypes-fwpm_net_event_header0.md) structure that contains information common to all events.
     */
    header : FWPM_NET_EVENT_HEADER0

    /**
     * A [FWPM_NET_EVENT_TYPE](ne-fwpmtypes-fwpm_net_event_type.md) value that specifies the type of event.
     */
    type : FWPM_NET_EVENT_TYPE

    ikeMmFailure : FWPM_NET_EVENT_IKEEXT_MM_FAILURE0.Ptr

    static __New() {
        DefineProp(this.Prototype, 'ikeQmFailure', { type: FWPM_NET_EVENT_IKEEXT_QM_FAILURE0.Ptr, offset: 96 })
        DefineProp(this.Prototype, 'ikeEmFailure', { type: FWPM_NET_EVENT_IKEEXT_EM_FAILURE0.Ptr, offset: 96 })
        DefineProp(this.Prototype, 'classifyDrop', { type: FWPM_NET_EVENT_CLASSIFY_DROP0.Ptr, offset: 96 })
        DefineProp(this.Prototype, 'ipsecDrop', { type: FWPM_NET_EVENT_IPSEC_KERNEL_DROP0.Ptr, offset: 96 })
        DefineProp(this.Prototype, 'idpDrop', { type: FWPM_NET_EVENT_IPSEC_DOSP_DROP0.Ptr, offset: 96 })
        this.DeleteProp("__New")
    }
}
