#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECTL.ahk

/**
 * The DD_LOCKDATA structure contains information necessary to do a lock as defined by the Microsoft DirectDraw parameter structures.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_lockdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_LOCKDATA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_global">DD_DIRECTDRAW_GLOBAL</a> structure that describes the driver's device.
     * @type {Pointer<DD_DIRECTDRAW_GLOBAL>}
     */
    lpDD {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure that describes the surface--in the case of <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568216(v=vs.85)">LockD3DBuffer</a>, a buffer--associated with the memory region to be locked down.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSurface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies whether the area in <b>rArea</b> is valid. A value of 0x00000001 indicates a valid area, 0x00000000 indicates an invalid area.
     * @type {Integer}
     */
    bHasRect {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that defines the area on the surface to lock down.
     * @type {RECTL}
     */
    rArea{
        get {
            if(!this.HasProp("__rArea"))
                this.__rArea := RECTL(20, this)
            return this.__rArea
        }
    }

    /**
     * Specifies the location in which the driver can return a pointer to the memory region that it locked down.
     * @type {Pointer<Void>}
     */
    lpSurfData {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Specifies the location in which the driver writes the return value of either the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_surfcb_lock">DdLock</a> or <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568216(v=vs.85)">LockD3DBuffer</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Used by the DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    Lock {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies a pointer to a user-mode mapping of the driver's memory. The driver performs this mapping in <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_mapmemory">DdMapMemory</a>. Windows 2000 and later only.
     * @type {Pointer}
     */
    fpProcess {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
