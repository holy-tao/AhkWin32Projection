#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDLOCKOUTINFO structure contains the surface information output from the DxLock function.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddlockoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDLOCKOUTINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Points to the surface in the frame buffer.
     * @type {Pointer}
     */
    dwSurfacePtr {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
