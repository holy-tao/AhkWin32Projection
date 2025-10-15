#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDSCAPS.ahk

/**
 * The DD_GETAVAILDRIVERMEMORYDATA structure contains the information needed by the driver to query and return the amount of free memory.
 * @see https://docs.microsoft.com/windows/win32/api//ddrawint/ns-ddrawint-dd_getavaildrivermemorydata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_GETAVAILDRIVERMEMORYDATA extends Win32Struct
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
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that describes the type of surface for which memory availability is being queried.
     * @type {DDSCAPS}
     */
    DDSCaps{
        get {
            if(!this.HasProp("__DDSCaps"))
                this.__DDSCaps := DDSCAPS(this.ptr + 8)
            return this.__DDSCaps
        }
    }

    /**
     * Specifies the location in which the driver returns the number of bytes of driver-managed memory that can be used for surfaces of the type described by <b>DDSCaps</b>.
     * @type {Integer}
     */
    dwTotal {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the location in which the driver returns the amount of free memory in bytes for the surface type described by <b>DDSCaps</b>.
     * @type {Integer}
     */
    dwFree {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the location in which the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getavaildrivermemory">DdGetAvailDriverMemory</a> callback. A return code of DD_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-values-for-directdraw">Return Values for DirectDraw</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Used by the Microsoft DirectDraw API and should not be filled in by the driver.
     * @type {Pointer<Void>}
     */
    GetAvailDriverMemory {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
