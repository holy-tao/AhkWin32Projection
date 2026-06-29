#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDCOMPBUFFERINFO.ahk" { DDCOMPBUFFERINFO }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DD_GETMOCOMPCOMPBUFFDATA structure contains the compressed buffer information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getmocompcompbuffdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETMOCOMPCOMPBUFFDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a GUID for which the compressed buffer information is requested.
     */
    lpGuid : Guid.Ptr

    /**
     * Indicates the width in pixels of the uncompressed output frame.
     */
    dwWidth : UInt32

    /**
     * Indicates the height in pixels of the uncompressed output frame.
     */
    dwHeight : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel format of the uncompressed output frame.
     */
    ddPixelFormat : DDPIXELFORMAT

    /**
     * Indicates how many different types of surfaces the driver requires to perform motion compensation using the requested GUID.
     */
    dwNumTypesCompBuffs : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-ddcompbufferinfo">DDCOMPBUFFERINFO</a> structure that contains the driver-supplied information for each type of required surface.
     */
    lpCompBuffInfo : DDCOMPBUFFERINFO.Ptr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getcompbuffinfo">DdMoCompGetBuffInfo</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
