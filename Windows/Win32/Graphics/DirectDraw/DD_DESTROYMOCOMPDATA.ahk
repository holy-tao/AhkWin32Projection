#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_MOTIONCOMP_LOCAL.ahk" { DD_MOTIONCOMP_LOCAL }
#Import ".\DD_DIRECTDRAW_LOCAL.ahk" { DD_DIRECTDRAW_LOCAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The DD_DESTROYMOCOMPDATA structure contains the information required to finish performing motion compensation.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_destroymocompdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_DESTROYMOCOMPDATA {
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
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_destroy">DdMoCompDestroy</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     */
    ddRVal : HRESULT

}
