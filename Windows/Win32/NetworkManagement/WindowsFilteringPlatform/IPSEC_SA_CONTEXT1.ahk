#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_DETAILS1.ahk" { IPSEC_SA_DETAILS1 }

/**
 * Encapsulates an inbound and outbound security association (SA) pair.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT1 {
    #StructPack 8

    /**
     * Identifies the SA context.
     */
    saContextId : Int64

    /**
     * An [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1) structure that contains information about the inbound SA.
     */
    inboundSa : IPSEC_SA_DETAILS1.Ptr

    /**
     * An [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1) structure that contains information about the outbound SA.
     */
    outboundSa : IPSEC_SA_DETAILS1.Ptr

}
