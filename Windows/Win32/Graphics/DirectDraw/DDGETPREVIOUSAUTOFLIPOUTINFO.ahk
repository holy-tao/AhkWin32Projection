#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDGETPREVIOUSAUTOFLIPOUTINFO structure provides the surface data.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddgetpreviousautoflipoutinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDGETPREVIOUSAUTOFLIPOUTINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the current zero-based index in the autoflip chain of the current surface.
     * @type {Integer}
     */
    dwSurfaceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the current zero-based index in the autoflip chain of the current <a href="https://docs.microsoft.com/windows-hardware/drivers/">vertical blanking interval (VBI)</a> surface.
     * @type {Integer}
     */
    dwVBISurfaceIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
