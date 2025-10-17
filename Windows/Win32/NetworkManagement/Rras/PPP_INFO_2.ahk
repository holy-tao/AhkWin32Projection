#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PPP_NBFCP_INFO.ahk
#Include .\PPP_IPCP_INFO2.ahk
#Include .\PPP_IPXCP_INFO.ahk
#Include .\PPP_ATCP_INFO.ahk
#Include .\PPP_CCP_INFO.ahk
#Include .\PPP_LCP_INFO.ahk

/**
 * The PPP_INFO_2 structure is used to report the results of the various Point-to-Point (PPP) projection operations for a connection.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_info_2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_INFO_2 extends Win32Struct
{
    static sizeof => 320

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_nbfcp_info">PPP_NBFCP_INFO</a> structure that contains PPP NetBEUI Framer (NBF) projection information.
     * @type {PPP_NBFCP_INFO}
     */
    nbf{
        get {
            if(!this.HasProp("__nbf"))
                this.__nbf := PPP_NBFCP_INFO(0, this)
            return this.__nbf
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipcp_info2">PPP_IPCP_INFO2</a> structure that contains PPP Internet Protocol (IP) projection information.
     * @type {PPP_IPCP_INFO2}
     */
    ip{
        get {
            if(!this.HasProp("__ip"))
                this.__ip := PPP_IPCP_INFO2(40, this)
            return this.__ip
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipxcp_info">PPP_IPXCP_INFO</a> structure that contains PPP Internetwork Packet Exchange (IPX) projection information.
     * @type {PPP_IPXCP_INFO}
     */
    ipx{
        get {
            if(!this.HasProp("__ipx"))
                this.__ipx := PPP_IPXCP_INFO(120, this)
            return this.__ipx
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_atcp_info">PPP_ATCP_INFO</a> structure that contains PPP AppleTalk projection information.
     * @type {PPP_ATCP_INFO}
     */
    at{
        get {
            if(!this.HasProp("__at"))
                this.__at := PPP_ATCP_INFO(176, this)
            return this.__at
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ccp_info">PPP_CCP_INFO</a> structure that contains Compression Control Protocol (CCP) projection information.
     * @type {PPP_CCP_INFO}
     */
    ccp{
        get {
            if(!this.HasProp("__ccp"))
                this.__ccp := PPP_CCP_INFO(248, this)
            return this.__ccp
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_lcp_info">PPP_LCP_INFO</a> structure that contains PPP Link Control Protocol (LCP) projection information.
     * @type {PPP_LCP_INFO}
     */
    lcp{
        get {
            if(!this.HasProp("__lcp"))
                this.__lcp := PPP_LCP_INFO(272, this)
            return this.__lcp
        }
    }
}
