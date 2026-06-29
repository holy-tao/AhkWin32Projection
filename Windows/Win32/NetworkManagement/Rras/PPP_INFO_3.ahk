#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_IPCP_INFO2.ahk" { PPP_IPCP_INFO2 }
#Import ".\PPP_NBFCP_INFO.ahk" { PPP_NBFCP_INFO }
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }
#Import ".\PPP_LCP_INFO.ahk" { PPP_LCP_INFO }
#Import ".\PPP_CCP_INFO.ahk" { PPP_CCP_INFO }
#Import ".\PPP_IPV6_CP_INFO.ahk" { PPP_IPV6_CP_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PPP_INFO_3 structure is used to report the results of the various Point-to-Point (PPP) projection operations for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_info_3
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_INFO_3 {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_nbfcp_info">PPP_NBFCP_INFO</a> structure that contains PPP NetBEUI Framer (NBF) projection information.
     */
    nbf : PPP_NBFCP_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipcp_info2">PPP_IPCP_INFO2</a> structure that contains PPP Internet Protocol (IP) projection information.
     */
    ip : PPP_IPCP_INFO2

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipv6_cp_info">PPP_IPV6_CP_INFO</a> structure that contains IPv6 control protocol projection information.
     */
    ipv6 : PPP_IPV6_CP_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ccp_info">PPP_CCP_INFO</a> structure that contains Compression Control Protocol (CCP) projection information.
     */
    ccp : PPP_CCP_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_lcp_info">PPP_LCP_INFO</a> structure that contains PPP Link Control Protocol (LCP) projection information.
     */
    lcp : PPP_LCP_INFO

}
