#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_FREEDRIVERMEMORYDATA structure contains the details of the free request.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_freedrivermemorydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_FREEDRIVERMEMORYDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure representing the surface that Microsoft DirectDraw is attempting to allocate.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_freedrivermemory">DdFreeDriverMemory</a> callback. A return code of DD_OK indicates that the driver succeeded in freeing some space; otherwise, the driver should set this to be DDERR_OUTOFMEMORY. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    FreeDriverMemory {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
