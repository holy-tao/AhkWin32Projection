#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_MOTIONCOMP_LOCAL.ahk" { DD_MOTIONCOMP_LOCAL }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DD_CREATEMOCOMPDATA structure contains the data required to begin using motion compensation.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createmocompdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_CREATEMOCOMPDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_motioncomp_local">DD_MOTIONCOMP_LOCAL</a> structure that contains a description of the motion compensation object.
     */
    lpMoComp : DD_MOTIONCOMP_LOCAL.Ptr

    /**
     * Points to a GUID that describes the motion compensation process being used.
     */
    lpGuid : Guid.Ptr

    /**
     * Specifies the width in pixels of the uncompressed output frame.
     */
    dwUncompWidth : UInt32

    /**
     * Specifies the height in pixels of the uncompressed output frame.
     */
    dwUncompHeight : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/ksmedia/ns-ksmedia-_ddpixelformat">DDPIXELFORMAT</a> structure that contains the format of the uncompressed output frame.
     */
    ddUncompPixelFormat : DDPIXELFORMAT

    /**
     * Points to an optional data buffer that contains any optional information required by the GUID given in <b>lpGuid</b>. This buffer cannot contain any embedded pointers.
     */
    lpData : IntPtr

    /**
     * Indicates the size in bytes of the data buffer contained in <b>lpData</b>.
     */
    dwDataSize : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_create">DdMoCompCreate</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
