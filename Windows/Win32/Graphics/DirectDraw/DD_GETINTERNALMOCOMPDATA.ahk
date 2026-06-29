#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DD_GETINTERNALMOCOMPDATA structure contains the internal memory requirements.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_getinternalmocompdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_GETINTERNALMOCOMPDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a GUID for which the internal memory requirement is requested.
     */
    lpGuid : Guid.Ptr

    /**
     * Indicates the width in pixels of uncompressed output frame.
     */
    dwWidth : UInt32

    /**
     * Indicates the height in pixels of uncompressed output frame.
     */
    dwHeight : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the pixel format of the uncompressed output frame.
     */
    ddPixelFormat : DDPIXELFORMAT

    /**
     * Indicates the size in bytes of internal memory that the display driver privately reserves to perform motion compensation
     */
    dwScratchMemAlloc : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getinternalinfo">DdMoCompGetInternalInfo</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
