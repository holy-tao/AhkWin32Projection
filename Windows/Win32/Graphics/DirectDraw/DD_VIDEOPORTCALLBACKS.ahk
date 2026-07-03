#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DD_VIDEOPORTCALLBACKS structure contains entry pointers to Microsoft DirectDraw video port extensions (VPE) callback functions that a device driver supports.
 * @remarks
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_VideoPortCallbacks GUID.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_videoportcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DD_VIDEOPORTCALLBACKS {
    #StructPack 8

    /**
     * Specifies the size in bytes of this DD_VIDEOPORTCALLBACKS structure.
     */
    dwSize : UInt32

    /**
     * Indicates what VPE callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_VPORT32_CANCREATEVIDEOPORT</dt>
     * <dt>DDHAL_VPORT32_CREATEVIDEOPORT</dt>
     * <dt>DDHAL_VPORT32_FLIP</dt>
     * <dt>DDHAL_VPORT32_GETBANDWIDTH</dt>
     * <dt>DDHAL_VPORT32_GETINPUTFORMATS</dt>
     * <dt>DDHAL_VPORT32_GETOUTPUTFORMATS</dt>
     * <dt>DDHAL_VPORT32_GETAUTOFLIPSURF</dt>
     * <dt>DDHAL_VPORT32_GETFIELD</dt>
     * <dt>DDHAL_VPORT32_GETLINE</dt>
     * <dt>DDHAL_VPORT32_GETCONNECT</dt>
     * <dt>DDHAL_VPORT32_DESTROY</dt>
     * <dt>DDHAL_VPORT32_GETFLIPSTATUS</dt>
     * <dt>DDHAL_VPORT32_UPDATE</dt>
     * <dt>DDHAL_VPORT32_WAITFORSYNC</dt>
     * <dt>DDHAL_VPORT32_GETSIGNALSTATUS</dt>
     * <dt>DDHAL_VPORT32_COLORCONTROL</dt>
     * </dl>
     */
    dwFlags : UInt32

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_cancreatevideoport">DdVideoPortCanCreate</a> callback.
     */
    CanCreateVideoPort : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_createvideoport">DdVideoPortCreate</a> callback.
     */
    CreateVideoPort : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_flip">DdVideoPortFlip</a> callback.
     */
    FlipVideoPort : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a> callback.
     */
    GetVideoPortBandwidth : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats">DdVideoPortGetInputFormats</a> callback.
     */
    GetVideoPortInputFormats : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getoutputformats">DdVideoPortGetOutputFormats</a> callback.
     */
    GetVideoPortOutputFormats : IntPtr

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    lpReserved1 : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getfield">DdVideoPortGetField</a> callback.
     */
    GetVideoPortField : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getline">DdVideoPortGetLine</a> callback.
     */
    GetVideoPortLine : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getvportconnect">DdVideoPortGetConnectInfo</a> callback.
     */
    GetVideoPortConnectInfo : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_destroyvport">DdVideoPortDestroy</a> callback.
     */
    DestroyVideoPort : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getflipstatus">DdVideoPortGetFlipStatus</a> callback.
     */
    GetVideoPortFlipStatus : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a> callback.
     */
    UpdateVideoPort : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_waitforsync">DdVideoPortWaitForSync</a> callback.
     */
    WaitForVideoPortSync : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getsignalstatus">DdVideoPortGetSignalStatus</a> callback.
     */
    GetVideoSignalStatus : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_colorcontrol">DdVideoPortColorControl</a> callback.
     */
    ColorControl : IntPtr

}
