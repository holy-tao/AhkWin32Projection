#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_DDMOTIONCOMPCALLBACKS extends Win32Struct
{
    static sizeof => 88

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
     * @type {Pointer<LPDDHALMOCOMPCB_GETGUIDS>}
     */
    GetMoCompGuids {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_GETFORMATS>}
     */
    GetMoCompFormats {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_CREATE>}
     */
    CreateMoComp {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_GETCOMPBUFFINFO>}
     */
    GetMoCompBuffInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_GETINTERNALINFO>}
     */
    GetInternalMoCompInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_BEGINFRAME>}
     */
    BeginMoCompFrame {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_ENDFRAME>}
     */
    EndMoCompFrame {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_RENDER>}
     */
    RenderMoComp {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_QUERYSTATUS>}
     */
    QueryMoCompStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<LPDDHALMOCOMPCB_DESTROY>}
     */
    DestroyMoComp {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
