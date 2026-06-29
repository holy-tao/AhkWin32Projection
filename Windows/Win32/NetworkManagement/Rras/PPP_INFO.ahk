#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_NBFCP_INFO.ahk" { PPP_NBFCP_INFO }
#Import ".\PPP_IPCP_INFO.ahk" { PPP_IPCP_INFO }
#Import ".\PPP_ATCP_INFO.ahk" { PPP_ATCP_INFO }
#Import ".\PPP_IPXCP_INFO.ahk" { PPP_IPXCP_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The PPP_INFO structure is used to report the results of the various Point-to-Point (PPP) projection operations for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_INFO {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_nbfcp_info">PPP_NBFCP_INFO</a> structure that contains PPP NetBEUI Framer (NBF) projection information.
     */
    nbf : PPP_NBFCP_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipcp_info">PPP_IPCP_INFO</a> structure that contains PPP Internet Protocol (IP) projection information.
     */
    ip : PPP_IPCP_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipxcp_info">PPP_IPXCP_INFO</a> structure that contains PPP Internetwork Packet Exchange (IPX) projection information.
     */
    ipx : PPP_IPXCP_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_atcp_info">PPP_ATCP_INFO</a> structure that contains PPP AppleTalk projection information.
     */
    at : PPP_ATCP_INFO

}
