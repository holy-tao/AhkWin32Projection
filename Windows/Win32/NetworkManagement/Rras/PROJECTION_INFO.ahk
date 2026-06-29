#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_PROJECTION_INFO.ahk" { PPP_PROJECTION_INFO }
#Import ".\IKEV2_PROJECTION_INFO.ahk" { IKEV2_PROJECTION_INFO }
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Is used in the RAS_CONNECTION_EX structure as a placeholder for the PPP_PROJECTION_INFO and IKEV2_PROJECTION_INFO structures.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PROJECTION_INFO {
    #StructPack 8

    /**
     * A value that specifies if the projection is for a Point-to-Point (PPP) or an Internet Key Exchange version 2 (IKEv2) based tunnel. The following values are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_PPP_PROJECTION_INFO_TYPE"></a><a id="mprapi_ppp_projection_info_type"></a><dl>
     * <dt><b>MPRAPI_PPP_PROJECTION_INFO_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_projection_info">PPP_PROJECTION_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IKEV2_PROJECTION_INFO_TYPE"></a><a id="mprapi_ikev2_projection_info_type"></a><dl>
     * <dt><b>MPRAPI_IKEV2_PROJECTION_INFO_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Data is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_projection_info">IKEV2_PROJECTION_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     */
    projectionInfoType : Int8

    PppProjectionInfo : PPP_PROJECTION_INFO

    static __New() {
        DefineProp(this.Prototype, 'Ikev2ProjectionInfo', { type: IKEV2_PROJECTION_INFO, offset: 8 })
        this.DeleteProp("__New")
    }
}
