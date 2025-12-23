#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDBOBNEXTFIELDINFO structure contains the bob information for the surface.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddbobnextfieldinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDBOBNEXTFIELDINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddsurfacedata">DDSURFACEDATA</a> structure that represents the surface.
     * @type {Pointer<DDSURFACEDATA>}
     */
    lpSurface {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
