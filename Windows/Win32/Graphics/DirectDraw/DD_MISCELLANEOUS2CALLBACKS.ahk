#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DD_MISCELLANEOUS2CALLBACKS structure is used to return the addresses of miscellaneous callback routines.
 * @see https://learn.microsoft.com/windows/win32/api/ddrawint/ns-ddrawint-dd_miscellaneous2callbacks
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD_MISCELLANEOUS2CALLBACKS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates which miscellaneous callback functions the driver implemented. For every bit set in <b>dwFlags</b>, the driver must initialize the corresponding function pointer member of this structure. This member can be one or more of the following flags:
     * 
     * 
     * <dl>
     * <dt>DDHAL_MISC2CB32_CREATESURFACEEX</dt>
     * <dt>DDHAL_MISC2CB32_GETDRIVERSTATE</dt>
     * <dt>DDHAL_MISC2CB32_DESTROYDDLOCAL</dt>
     * </dl>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unused and must be set to <b>NULL</b>.
     * @type {Pointer<PDD_ALPHABLT>}
     */
    AlphaBlt {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_createsurfaceex">D3dCreateSurfaceEx</a> implementation. This callback creates an association between a DirectDraw surface and a small integer handle.
     * @type {Pointer<PDD_CREATESURFACEEX>}
     */
    CreateSurfaceEx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_getdriverstate">D3dGetDriverState</a> implementation.
     * @type {Pointer<PDD_GETDRIVERSTATE>}
     */
    GetDriverState {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Points to the driver's <a href="https://docs.microsoft.com/windows/desktop/api/ddrawint/nc-ddrawint-pdd_destroyddlocal">D3dDestroyDDLocal</a> implementation. Used to destroy the local copy of the device context.
     * @type {Pointer<PDD_DESTROYDDLOCAL>}
     */
    DestroyDDLocal {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
