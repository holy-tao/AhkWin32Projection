#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDVIDEOPORTCONNECT.ahk" { DDVIDEOPORTCONNECT }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The DD_GETVPORTCONNECTDATA structure contains the connection combinations supported by the specified video port extensions (VPE) object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getvportconnectdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETVPORTCONNECTDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Specifies the ID of the VPE object for which the driver is to retrieve connection information. DirectDraw obtains this ID from the <b>dwVideoPortID</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dvp/ns-dvp-ddvideoportcaps">DDVIDEOPORTCAPS</a> structure.
     */
    dwPortId : UInt32

    /**
     * Points to an array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddvideoportconnect">DDVIDEOPORTCONNECT</a> structures in which the driver should return the characteristics of each connection that the VPE object supports. This member can be <b>NULL</b>.
     */
    lpConnect : DDVIDEOPORTCONNECT.Ptr

    /**
     * Specifies the location in which the driver returns the number of connection combinations supported by the specified VPE object.
     */
    dwNumEntries : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getvportconnect">DdVideoPortGetConnectInfo</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     */
    GetVideoPortConnectInfo : IntPtr

}
