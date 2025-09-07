#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DDHAL_DESTROYDDLOCALDATA contains the information required for the driver to destroy a set of surfaces associated to a given local DirectDraw object.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawi/ns-ddrawi-ddhal_destroyddlocaldata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHAL_DESTROYDDLOCALDATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Unused.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Points to the local Direct Draw object that serves as a reference for all Direct3D surfaces that have to be destroyed.
     * @type {Pointer<DDRAWI_DIRECTDRAW_LCL>}
     */
    pDDLcl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the location where the driver writes the return value of <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_destroyddlocal">D3dDestroyDDLocal</a>. A return code of D3D_OK indicates success. For more information, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/return-codes-for-direct3d-driver-callbacks">Return Codes for Direct3D Driver Callbacks</a>.
     * @type {Integer}
     */
    ddRVal {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
