#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PPP_NBFCP_INFO.ahk
#Include .\PPP_IPCP_INFO2.ahk
#Include .\PPP_IPV6_CP_INFO.ahk
#Include .\PPP_CCP_INFO.ahk
#Include .\PPP_LCP_INFO.ahk

/**
 * The PPP_INFO_3 structure is used to report the results of the various Point-to-Point (PPP) projection operations for a connection.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_info_3
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_INFO_3 extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_nbfcp_info">PPP_NBFCP_INFO</a> structure that contains PPP NetBEUI Framer (NBF) projection information.
     * @type {PPP_NBFCP_INFO}
     */
    nbf{
        get {
            if(!this.HasProp("__nbf"))
                this.__nbf := PPP_NBFCP_INFO(this.ptr + 0)
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
                this.__ip := PPP_IPCP_INFO2(this.ptr + 40)
            return this.__ip
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipv6_cp_info">PPP_IPV6_CP_INFO</a> structure that contains IPv6 control protocol projection information.
     * @type {PPP_IPV6_CP_INFO}
     */
    ipv6{
        get {
            if(!this.HasProp("__ipv6"))
                this.__ipv6 := PPP_IPV6_CP_INFO(this.ptr + 120)
            return this.__ipv6
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
                this.__ccp := PPP_CCP_INFO(this.ptr + 168)
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
                this.__lcp := PPP_LCP_INFO(this.ptr + 192)
            return this.__lcp
        }
    }
}
