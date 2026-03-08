#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_lcp_info">PPP_LCP_INFO</see>, <see href="https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_projection_info">PPP_PROJECTION_INFO</see>, <see href="https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_projection_info">PPP_PROJECTION_INFO</see>, <see href="https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_projection_info2">PPP_PROJECTION_INFO2</see>, <see href="https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_projection_info2">PPP_PROJECTION_INFO2</see>.
 * @see 
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_LCP extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_PAP => 49187

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_CHAP => 49699

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_EAP => 49703

    /**
     * @type {Integer (UInt32)}
     */
    static PPP_LCP_SPAP => 49191
}
