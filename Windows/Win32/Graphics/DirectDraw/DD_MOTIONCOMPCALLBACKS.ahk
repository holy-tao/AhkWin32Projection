#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDD_MOCOMPCB_BEGINFRAME.ahk" { PDD_MOCOMPCB_BEGINFRAME }
#Import ".\PDD_MOCOMPCB_CREATE.ahk" { PDD_MOCOMPCB_CREATE }
#Import ".\PDD_MOCOMPCB_DESTROY.ahk" { PDD_MOCOMPCB_DESTROY }
#Import ".\PDD_MOCOMPCB_ENDFRAME.ahk" { PDD_MOCOMPCB_ENDFRAME }
#Import ".\PDD_MOCOMPCB_GETCOMPBUFFINFO.ahk" { PDD_MOCOMPCB_GETCOMPBUFFINFO }
#Import ".\PDD_MOCOMPCB_GETFORMATS.ahk" { PDD_MOCOMPCB_GETFORMATS }
#Import ".\PDD_MOCOMPCB_GETGUIDS.ahk" { PDD_MOCOMPCB_GETGUIDS }
#Import ".\PDD_MOCOMPCB_GETINTERNALINFO.ahk" { PDD_MOCOMPCB_GETINTERNALINFO }
#Import ".\PDD_MOCOMPCB_QUERYSTATUS.ahk" { PDD_MOCOMPCB_QUERYSTATUS }
#Import ".\PDD_MOCOMPCB_RENDER.ahk" { PDD_MOCOMPCB_RENDER }

/**
 * The DD_MOTIONCOMPCALLBACKS structure contains entry pointers to the motion compensation callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_MotionCompCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_motioncompcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_MOTIONCOMPCALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_MOTIONCOMPCALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates what additional Microsoft DirectDraw motion compensation callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_MOCOMP32_BEGINFRAME</dt>
     * <dt>DDHAL_MOCOMP32_CREATE</dt>
     * <dt>DDHAL_MOCOMP32_DESTROY</dt>
     * <dt>DDHAL_MOCOMP32_GETCOMPBUFFINFO</dt>
     * <dt>DDHAL_MOCOMP32_GETINTERNALINFO</dt>
     * <dt>DDHAL_MOCOMP32_ENDFRAME</dt>
     * <dt>DDHAL_MOCOMP32_GETFORMATS</dt>
     * <dt>DDHAL_MOCOMP32_GETGUIDS</dt>
     * <dt>DDHAL_MOCOMP32_QUERYSTATUS</dt>
     * <dt>DDHAL_MOCOMP32_RENDER</dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getguids">DdMoCompGetGuids</a> callback function.
     */
    GetMoCompGuids : PDD_MOCOMPCB_GETGUIDS

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getformats">DdMoCompGetFormats</a> callback function.
     */
    GetMoCompFormats : PDD_MOCOMPCB_GETFORMATS

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_create">DdMoCompCreate</a> callback function.
     */
    CreateMoComp : PDD_MOCOMPCB_CREATE

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getcompbuffinfo">DdMoCompGetBuffInfo</a> callback function.
     */
    GetMoCompBuffInfo : PDD_MOCOMPCB_GETCOMPBUFFINFO

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getinternalinfo">DdMoCompGetInternalInfo</a> callback function.
     */
    GetInternalMoCompInfo : PDD_MOCOMPCB_GETINTERNALINFO

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe">DdMoCompBeginFrame</a> callback function.
     */
    BeginMoCompFrame : PDD_MOCOMPCB_BEGINFRAME

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_endframe">DdMoCompEndFrame</a> callback function.
     */
    EndMoCompFrame : PDD_MOCOMPCB_ENDFRAME

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_render">DdMoCompRender</a> callback function.
     */
    RenderMoComp : PDD_MOCOMPCB_RENDER

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_querystatus">DdMoCompQueryStatus</a> callback function.
     */
    QueryMoCompStatus : PDD_MOCOMPCB_QUERYSTATUS

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_destroy">DdMoCompDestroy</a> callback function.
     */
    DestroyMoComp : PDD_MOCOMPCB_DESTROY

}
