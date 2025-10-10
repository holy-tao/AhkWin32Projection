#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_SURFACECALLBACKS structure contains entry pointers to the Microsoft DirectDraw surface callback functions that a device driver supports.
 * @remarks
 * 
  * Entries that the display driver does not use should be set to <b>NULL</b>. The driver initializes this structure in <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvenabledirectdraw">DrvEnableDirectDraw</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_surfacecallbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SURFACECALLBACKS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Specifies the size in bytes of the DD_SURFACECALLBACKS structure. This member is unused by Microsoft Windows 2000 and later versions.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates which DirectDrawSurface callback functions the driver has implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_SURFCB32_DESTROYSURFACE</dt>
     * <dt>DDHAL_SURFCB32_FLIP</dt>
     * <dt>DDHAL_SURFCB32_SETCLIPLIST</dt>
     * <dt>DDHAL_SURFCB32_LOCK</dt>
     * <dt>DDHAL_SURFCB32_UNLOCK</dt>
     * <dt>DDHAL_SURFCB32_BLT</dt>
     * <dt>DDHAL_SURFCB32_SETCOLORKEY</dt>
     * <dt>DDHAL_SURFCB32_ADDATTACHEDSURFACE</dt>
     * <dt>DDHAL_SURFCB32_GETBLTSTATUS</dt>
     * <dt>DDHAL_SURFCB32_GETFLIPSTATUS</dt>
     * <dt>DDHAL_SURFCB32_UPDATEOVERLAY</dt>
     * <dt>DDHAL_SURFCB32_SETOVERLAYPOSITION</dt>
     * <dt>DDHAL_SURFCB32_SETPALETTE</dt>
     * </dl>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_destroysurface">DdDestroySurface</a> surface callback.
     * @type {Pointer<PDD_SURFCB_DESTROYSURFACE>}
     */
    DestroySurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_flip">DdFlip</a> surface callback.
     * @type {Pointer<PDD_SURFCB_FLIP>}
     */
    Flip {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows-hardware/drivers/display/windows-vista-display-driver-model-design-guide">DdSetClipList</a> surface callback.
     * @type {Pointer<PDD_SURFCB_SETCLIPLIST>}
     */
    SetClipList {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> surface callback.
     * @type {Pointer<PDD_SURFCB_LOCK>}
     */
    Lock {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_unlock">DdUnlock</a> surface callback.
     * @type {Pointer<PDD_SURFCB_UNLOCK>}
     */
    Unlock {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_blt">DdBlt</a> surface callback.
     * @type {Pointer<PDD_SURFCB_BLT>}
     */
    Blt {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setcolorkey">DdSetColorKey</a> surface callback.
     * @type {Pointer<PDD_SURFCB_SETCOLORKEY>}
     */
    SetColorKey {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_addattachedsurface">DdAddAttachedSurface</a> surface callback.
     * @type {Pointer<PDD_SURFCB_ADDATTACHEDSURFACE>}
     */
    AddAttachedSurface {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_getbltstatus">DdGetBltStatus</a> surface callback.
     * @type {Pointer<PDD_SURFCB_GETBLTSTATUS>}
     */
    GetBltStatus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_getflipstatus">DdGetFlipStatus</a> surface callback.
     * @type {Pointer<PDD_SURFCB_GETFLIPSTATUS>}
     */
    GetFlipStatus {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_updateoverlay">DdUpdateOverlay</a> surface callback.
     * @type {Pointer<PDD_SURFCB_UPDATEOVERLAY>}
     */
    UpdateOverlay {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setoverlayposition">DdSetOverlayPosition</a> surface callback.
     * @type {Pointer<PDD_SURFCB_SETOVERLAYPOSITION>}
     */
    SetOverlayPosition {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Void>}
     */
    reserved4 {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Points to the driver-supplied <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_setpalette">DdSetPalette</a> surface callback.
     * @type {Pointer<PDD_SURFCB_SETPALETTE>}
     */
    SetPalette {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
