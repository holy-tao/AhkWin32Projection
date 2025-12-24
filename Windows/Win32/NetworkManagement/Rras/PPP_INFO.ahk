#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PPP_NBFCP_INFO.ahk
#Include .\PPP_IPCP_INFO.ahk
#Include .\PPP_IPXCP_INFO.ahk
#Include .\PPP_ATCP_INFO.ahk

/**
 * The PPP_INFO structure is used to report the results of the various Point-to-Point (PPP) projection operations for a connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_INFO extends Win32Struct
{
    static sizeof => 232

    static packingSize => 4

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
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_ipcp_info">PPP_IPCP_INFO</a> structure that contains PPP Internet Protocol (IP) projection information.
     * @type {PPP_IPCP_INFO}
     */
    ip{
        get {
            if(!this.HasProp("__ip"))
                this.__ip := PPP_IPCP_INFO(40, this)
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
                this.__ipx := PPP_IPXCP_INFO(108, this)
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
                this.__at := PPP_ATCP_INFO(160, this)
            return this.__at
        }
    }
}
