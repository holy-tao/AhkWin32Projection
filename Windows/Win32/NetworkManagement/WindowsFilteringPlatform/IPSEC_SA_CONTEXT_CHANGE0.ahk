#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_CONTEXT_EVENT_TYPE0.ahk" { IPSEC_SA_CONTEXT_EVENT_TYPE0 }

/**
 * Contains information about an IPsec security association (SA) context change.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_change0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT_CHANGE0 {
    #StructPack 8

    /**
     * Type: [IPSEC_SA_CONTEXT_EVENT_TYPE0](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_sa_context_event_type0)</b>
     * 
     * The type of IPsec SA context change event.
     */
    changeType : IPSEC_SA_CONTEXT_EVENT_TYPE0

    /**
     * Type: <b>UINT64</b>
     * 
     * Identifier of the IPsec SA context that changed.
     */
    saContextId : Int64

}
