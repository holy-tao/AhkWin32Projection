#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_SYNCSURFACEDATA structure contains the surface information.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_syncsurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_SYNCSURFACEDATA extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure that is relevant to the current Microsoft DirectDraw process only.
     * @type {Pointer<TypeHandle>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes the surface with which to sync.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains the byte offset from the start of the frame buffer to the start of the surface. This value is used only by the video miniport driver. This member must contain data that is filled in by the driver.
     * @type {Integer}
     */
    dwSurfaceOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Contains the pointer value to be returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> call for accessing the surface. This value is used by a kernel-mode client. This member can be modified by the driver, but does not need to be.
     * @type {Pointer}
     */
    fpLockPtr {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Contains the pitch in bytes passed to the client during a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> call. This member can be modified by the driver, but does not need to be.
     * @type {Integer}
     */
    lPitch {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Contains the byte offset from the start of the frame buffer to the start of the overlay. This value is used only by the video miniport driver and may be different than the <b>dwSurfaceOffset</b> member if cropping is involved or if the overlay origin is not the top left of the surface. This member must contain data that is filled in by the driver.
     * @type {Integer}
     */
    dwOverlayOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Reserved for use by the display driver.
     * @type {Integer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved for use by the display driver. Windows 2000 and later only.
     * @type {Integer}
     */
    dwDriverReserved4 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_kernelcb_syncsurface">DdSyncSurfaceData</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
