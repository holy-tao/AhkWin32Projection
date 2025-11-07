#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_MOTIONCOMPCALLBACKS structure contains entry pointers to the motion compensation callback functions that a device driver supports.
 * @remarks
 * 
 * Entries that the display driver does not use should be set to <b>NULL</b>. The driver should initialize this structure when its <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverinfo">DdGetDriverInfo</a> function is called with the GUID_MotionCompCallbacks GUID.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_motioncompcallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_MOTIONCOMPCALLBACKS extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Specifies the size in bytes of this DD_MOTIONCOMPCALLBACKS structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getguids">DdMoCompGetGuids</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_GETGUIDS>}
     */
    GetMoCompGuids {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getformats">DdMoCompGetFormats</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_GETFORMATS>}
     */
    GetMoCompFormats {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_create">DdMoCompCreate</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_CREATE>}
     */
    CreateMoComp {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getcompbuffinfo">DdMoCompGetBuffInfo</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_GETCOMPBUFFINFO>}
     */
    GetMoCompBuffInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_getinternalinfo">DdMoCompGetInternalInfo</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_GETINTERNALINFO>}
     */
    GetInternalMoCompInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_beginframe">DdMoCompBeginFrame</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_BEGINFRAME>}
     */
    BeginMoCompFrame {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_endframe">DdMoCompEndFrame</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_ENDFRAME>}
     */
    EndMoCompFrame {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_render">DdMoCompRender</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_RENDER>}
     */
    RenderMoComp {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_querystatus">DdMoCompQueryStatus</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_QUERYSTATUS>}
     */
    QueryMoCompStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mocompcb_destroy">DdMoCompDestroy</a> callback function.
     * @type {Pointer<PDD_MOCOMPCB_DESTROY>}
     */
    DestroyMoComp {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
