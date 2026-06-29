#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
    GetMoCompGuids : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getformats">DdMoCompGetFormats</a> callback function.
     */
    GetMoCompFormats : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_create">DdMoCompCreate</a> callback function.
     */
    CreateMoComp : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getcompbuffinfo">DdMoCompGetBuffInfo</a> callback function.
     */
    GetMoCompBuffInfo : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getinternalinfo">DdMoCompGetInternalInfo</a> callback function.
     */
    GetInternalMoCompInfo : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe">DdMoCompBeginFrame</a> callback function.
     */
    BeginMoCompFrame : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_endframe">DdMoCompEndFrame</a> callback function.
     */
    EndMoCompFrame : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_render">DdMoCompRender</a> callback function.
     */
    RenderMoComp : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_querystatus">DdMoCompQueryStatus</a> callback function.
     */
    QueryMoCompStatus : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_destroy">DdMoCompDestroy</a> callback function.
     */
    DestroyMoComp : IntPtr

}
