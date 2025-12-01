#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDLOCKININFO structure contains the surface information.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddlockininfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDLOCKININFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that contains the surface information.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpSurfaceData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
