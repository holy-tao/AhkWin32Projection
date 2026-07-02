#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDD_VPORTCB_WAITFORSYNC.ahk" { PDD_VPORTCB_WAITFORSYNC }
#Import ".\PDD_VPORTCB_GETLINE.ahk" { PDD_VPORTCB_GETLINE }
#Import ".\PDD_VPORTCB_FLIP.ahk" { PDD_VPORTCB_FLIP }
#Import ".\PDD_VPORTCB_COLORCONTROL.ahk" { PDD_VPORTCB_COLORCONTROL }
#Import ".\PDD_VPORTCB_GETOUTPUTFORMATS.ahk" { PDD_VPORTCB_GETOUTPUTFORMATS }
#Import ".\PDD_VPORTCB_DESTROYVPORT.ahk" { PDD_VPORTCB_DESTROYVPORT }
#Import ".\PDD_VPORTCB_GETFIELD.ahk" { PDD_VPORTCB_GETFIELD }
#Import ".\PDD_VPORTCB_CREATEVIDEOPORT.ahk" { PDD_VPORTCB_CREATEVIDEOPORT }
#Import ".\PDD_VPORTCB_GETSIGNALSTATUS.ahk" { PDD_VPORTCB_GETSIGNALSTATUS }
#Import ".\PDD_VPORTCB_UPDATE.ahk" { PDD_VPORTCB_UPDATE }
#Import ".\PDD_VPORTCB_GETVPORTCONNECT.ahk" { PDD_VPORTCB_GETVPORTCONNECT }
#Import ".\PDD_VPORTCB_GETBANDWIDTH.ahk" { PDD_VPORTCB_GETBANDWIDTH }
#Import ".\PDD_VPORTCB_GETFLIPSTATUS.ahk" { PDD_VPORTCB_GETFLIPSTATUS }
#Import ".\PDD_VPORTCB_GETINPUTFORMATS.ahk" { PDD_VPORTCB_GETINPUTFORMATS }
#Import ".\PDD_VPORTCB_CANCREATEVIDEOPORT.ahk" { PDD_VPORTCB_CANCREATEVIDEOPORT }

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
    CanCreateVideoPort : PDD_VPORTCB_CANCREATEVIDEOPORT

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_createvideoport">DdVideoPortCreate</a> callback.
     */
    CreateVideoPort : PDD_VPORTCB_CREATEVIDEOPORT

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_flip">DdVideoPortFlip</a> callback.
     */
    FlipVideoPort : PDD_VPORTCB_FLIP

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a> callback.
     */
    GetVideoPortBandwidth : PDD_VPORTCB_GETBANDWIDTH

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats">DdVideoPortGetInputFormats</a> callback.
     */
    GetVideoPortInputFormats : PDD_VPORTCB_GETINPUTFORMATS

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getoutputformats">DdVideoPortGetOutputFormats</a> callback.
     */
    GetVideoPortOutputFormats : PDD_VPORTCB_GETOUTPUTFORMATS

    /**
     * Reserved for system use and should be ignored by the driver.
     */
    lpReserved1 : IntPtr

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getfield">DdVideoPortGetField</a> callback.
     */
    GetVideoPortField : PDD_VPORTCB_GETFIELD

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getline">DdVideoPortGetLine</a> callback.
     */
    GetVideoPortLine : PDD_VPORTCB_GETLINE

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getvportconnect">DdVideoPortGetConnectInfo</a> callback.
     */
    GetVideoPortConnectInfo : PDD_VPORTCB_GETVPORTCONNECT

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_destroyvport">DdVideoPortDestroy</a> callback.
     */
    DestroyVideoPort : PDD_VPORTCB_DESTROYVPORT

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getflipstatus">DdVideoPortGetFlipStatus</a> callback.
     */
    GetVideoPortFlipStatus : PDD_VPORTCB_GETFLIPSTATUS

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a> callback.
     */
    UpdateVideoPort : PDD_VPORTCB_UPDATE

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_waitforsync">DdVideoPortWaitForSync</a> callback.
     */
    WaitForVideoPortSync : PDD_VPORTCB_WAITFORSYNC

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getsignalstatus">DdVideoPortGetSignalStatus</a> callback.
     */
    GetVideoSignalStatus : PDD_VPORTCB_GETSIGNALSTATUS

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_colorcontrol">DdVideoPortColorControl</a> callback.
     */
    ColorControl : PDD_VPORTCB_COLORCONTROL

}
