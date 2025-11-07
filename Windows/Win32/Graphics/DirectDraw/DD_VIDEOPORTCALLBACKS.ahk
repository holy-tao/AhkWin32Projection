#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_VIDEOPORTCALLBACKS structure contains entry pointers to Microsoft DirectDraw video port extensions (VPE) callback functions that a device driver supports.
 * @remarks
 * 
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_VideoPortCallbacks GUID.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_videoportcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_VIDEOPORTCALLBACKS extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_VIDEOPORTCALLBACKS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_cancreatevideoport">DdVideoPortCanCreate</a> callback.
     * @type {Pointer<PDD_VPORTCB_CANCREATEVIDEOPORT>}
     */
    CanCreateVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_createvideoport">DdVideoPortCreate</a> callback.
     * @type {Pointer<PDD_VPORTCB_CREATEVIDEOPORT>}
     */
    CreateVideoPort {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_flip">DdVideoPortFlip</a> callback.
     * @type {Pointer<PDD_VPORTCB_FLIP>}
     */
    FlipVideoPort {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getbandwidth">DdVideoPortGetBandwidth</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETBANDWIDTH>}
     */
    GetVideoPortBandwidth {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getinputformats">DdVideoPortGetInputFormats</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETINPUTFORMATS>}
     */
    GetVideoPortInputFormats {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getoutputformats">DdVideoPortGetOutputFormats</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETOUTPUTFORMATS>}
     */
    GetVideoPortOutputFormats {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Void>}
     */
    lpReserved1 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getfield">DdVideoPortGetField</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETFIELD>}
     */
    GetVideoPortField {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getline">DdVideoPortGetLine</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETLINE>}
     */
    GetVideoPortLine {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getvportconnect">DdVideoPortGetConnectInfo</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETVPORTCONNECT>}
     */
    GetVideoPortConnectInfo {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_destroyvport">DdVideoPortDestroy</a> callback.
     * @type {Pointer<PDD_VPORTCB_DESTROYVPORT>}
     */
    DestroyVideoPort {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getflipstatus">DdVideoPortGetFlipStatus</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETFLIPSTATUS>}
     */
    GetVideoPortFlipStatus {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_update">DdVideoPortUpdate</a> callback.
     * @type {Pointer<PDD_VPORTCB_UPDATE>}
     */
    UpdateVideoPort {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_waitforsync">DdVideoPortWaitForSync</a> callback.
     * @type {Pointer<PDD_VPORTCB_WAITFORSYNC>}
     */
    WaitForVideoPortSync {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_getsignalstatus">DdVideoPortGetSignalStatus</a> callback.
     * @type {Pointer<PDD_VPORTCB_GETSIGNALSTATUS>}
     */
    GetVideoSignalStatus {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_vportcb_colorcontrol">DdVideoPortColorControl</a> callback.
     * @type {Pointer<PDD_VPORTCB_COLORCONTROL>}
     */
    ColorControl {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
