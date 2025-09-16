#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_DDVIDEOPORTCALLBACKS extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_CANCREATEVIDEOPORT>}
     */
    CanCreateVideoPort {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_CREATEVIDEOPORT>}
     */
    CreateVideoPort {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_FLIP>}
     */
    FlipVideoPort {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETBANDWIDTH>}
     */
    GetVideoPortBandwidth {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETINPUTFORMATS>}
     */
    GetVideoPortInputFormats {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETOUTPUTFORMATS>}
     */
    GetVideoPortOutputFormats {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpReserved1 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETFIELD>}
     */
    GetVideoPortField {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETLINE>}
     */
    GetVideoPortLine {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETVPORTCONNECT>}
     */
    GetVideoPortConnectInfo {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_DESTROYVPORT>}
     */
    DestroyVideoPort {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETFLIPSTATUS>}
     */
    GetVideoPortFlipStatus {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_UPDATE>}
     */
    UpdateVideoPort {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_WAITFORSYNC>}
     */
    WaitForVideoPortSync {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_GETSIGNALSTATUS>}
     */
    GetVideoSignalStatus {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<LPDDHALVPORTCB_COLORCONTROL>}
     */
    ColorControl {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
