#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PPP_PROJECTION_INFO2.ahk
#Include .\IKEV2_PROJECTION_INFO2.ahk

/**
 * Used in the RAS_CONNECTION_4 structure as a placeholder for the PPP_PROJECTION_INFO2 and IKEV2_PROJECTION_INFO2 structures.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-projection_info2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PROJECTION_INFO2 extends Win32Struct
{
    static sizeof => 208

    static packingSize => 8

    /**
     * A value that specifies if the projection is for a Point-to-Point (PPP) or an Internet Key Exchange version 2 (IKEv2) based tunnel. The following values are supported.
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
     * The data is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_projection_info2">PPP_PROJECTION_INFO2</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IKEV2_PROJECTION_INFO_TYPE"></a><a id="mprapi_ikev2_projection_info_type"></a><dl>
     * <dt><b>MPRAPI_IKEV2_PROJECTION_INFO_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The data is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ikev2_projection_info2">IKEV2_PROJECTION_INFO2</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    projectionInfoType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {PPP_PROJECTION_INFO2}
     */
    PppProjectionInfo{
        get {
            if(!this.HasProp("__PppProjectionInfo"))
                this.__PppProjectionInfo := PPP_PROJECTION_INFO2(8, this)
            return this.__PppProjectionInfo
        }
    }

    /**
     * @type {IKEV2_PROJECTION_INFO2}
     */
    Ikev2ProjectionInfo{
        get {
            if(!this.HasProp("__Ikev2ProjectionInfo"))
                this.__Ikev2ProjectionInfo := IKEV2_PROJECTION_INFO2(8, this)
            return this.__Ikev2ProjectionInfo
        }
    }
}
