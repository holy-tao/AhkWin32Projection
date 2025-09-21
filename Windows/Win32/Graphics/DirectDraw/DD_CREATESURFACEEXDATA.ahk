#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_CREATESURFACEEXDATA structure contains information required for the driver to create a surface and associate with it a supplied texture handle.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_createsurfaceexdata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_CREATESURFACEEXDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies a set of flags for the <b>D3dCreateSurfaceEx</b> function that are currently not used and always zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a handle to the DirectDraw object created by the application. This is the scope within which the <b>lpDDSLcl</b> handles exist. A <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_directdraw_local">DD_DIRECTDRAW_LOCAL</a> structure describes the driver.
     * @type {Pointer<TypeHandle>}
     */
    lpDDLcl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a handle to the DirectDraw surface to be created for Direct3D. These handles are unique within each different DD_DIRECTDRAW_LOCAL structure. A <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/ns-ddrawint-dd_surface_local">DD_SURFACE_LOCAL</a> structure represents the created surface object.
     * @type {Pointer<DD_SURFACE_LOCAL>}
     */
    lpDDSLcl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the location where the driver writes the return value of the <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> callback. A return code of D3D_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-codes-for-direct3d-driver-callbacks">Return Codes for Direct3D Driver Callbacks</a>.
     * @type {HRESULT}
     */
    ddRVal {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
