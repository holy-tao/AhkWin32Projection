#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_SA_DETAILS0.ahk" { IPSEC_SA_DETAILS0 }

/**
 * Encapsulates an inbound and outbound SA pair.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_CONTEXT0 {
    #StructPack 8

    /**
     * Identifies the SA context.
     */
    saContextId : Int64

    /**
     * An [IPSEC_SA_DETAILS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0) structure that contains information about the inbound SA.
     */
    inboundSa : IPSEC_SA_DETAILS0.Ptr

    /**
     * An [IPSEC_SA_DETAILS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0) structure that contains information about the outbound SA.
     */
    outboundSa : IPSEC_SA_DETAILS0.Ptr

}
