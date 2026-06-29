#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_MOTIONCOMP_LOCAL.ahk" { DD_MOTIONCOMP_LOCAL }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import ".\DDMOCOMPBUFFERINFO.ahk" { DDMOCOMPBUFFERINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The DD_RENDERMOCOMPDATA structure contains the information required to render a frame.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_rendermocompdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_RENDERMOCOMPDATA {
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
     * Indicates the number of entries in the <b>lpBufferInfo</b> member.
     */
    dwNumBuffers : UInt32

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-ddmocompbufferinfo">DDMOCOMPBUFFERINFO</a> structure that contains the surfaces and the locations within the surfaces from which to get the macroblock data to render.
     */
    lpBufferInfo : DDMOCOMPBUFFERINFO.Ptr

    /**
     * Indicates a specific operation the decoder would like the driver to perform. The possible values for this member are defined by the GUID used during motion compensation. See <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_createmocompdata">DD_CREATEMOCOMPDATA</a> for more information.
     */
    dwFunction : UInt32

    /**
     * Points to an optional input buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     */
    lpInputData : IntPtr

    /**
     * Specifies the size in bytes of the data pointed to by <b>lpInputData</b>.
     */
    dwInputDataSize : UInt32

    /**
     * Points to an optional output buffer, the contents of which are defined by the GUID. This buffer cannot contain any embedded pointers.
     */
    lpOutputData : IntPtr

    /**
     * Specifies the size in bytes of the data pointed to by <b>lpOutputData</b>.
     */
    dwOutputDataSize : UInt32

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_render">DdMoCompRender</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
