#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_MOTIONCOMP_LOCAL.ahk" { DD_MOTIONCOMP_LOCAL }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DD_SURFACE_LOCAL.ahk" { DD_SURFACE_LOCAL }

/**
 * The DDHAL_BEGINMOCOMPFRAMEDATA structure contains the frame information required to start decoding.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_beginmocompframedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_BEGINMOCOMPFRAMEDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     */
    lpDD : DD_DIRECTDRAW_LOCAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_motioncomp_local">DD_MOTIONCOMP_LOCAL</a> structure that contains a description of the motion compensation being requested.
     */
    lpMoComp : DD_MOTIONCOMP_LOCAL.Ptr

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure representing the destination surface in which to decode this frame.
     */
    lpDestSurface : DD_SURFACE_LOCAL.Ptr

    /**
     * Indicates the size in bytes of optional input data in <b>lpInputData</b> that is required to begin this frame.
     */
    dwInputDataSize : UInt32

    /**
     * Points to an optional input buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     */
    lpInputData : IntPtr

    /**
     * Indicates the size in bytes of optional output data in <b>lpOutputData</b> that is required to begin this frame.
     */
    dwOutputDataSize : UInt32

    /**
     * Points to an optional output buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     */
    lpOutputData : IntPtr

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe">DdMoCompBeginFrame</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
