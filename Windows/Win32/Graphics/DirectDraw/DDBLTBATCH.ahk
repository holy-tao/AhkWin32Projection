#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDBLTBATCH structure passes bit block transfer (bitblt) operations to the IDirectDrawSurface7::BltBatch method.
 * @see https://docs.microsoft.com/windows/win32/api//ddraw/ns-ddraw-ddbltbatch
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDBLTBATCH extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the destination for the bitblt.
     * @type {Pointer<RECT>}
     */
    lprDest {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Address of a DirectDrawSurface object to be the source of the bitblt.
     * @type {Pointer<IDirectDrawSurface>}
     */
    lpDDSSrc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that defines the source rectangle of the bitblt.
     * @type {Pointer<RECT>}
     */
    lprSrc {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional control flags. The following values are defined:
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/ns-ddraw-ddbltfx">DDBLTFX</a> structure that specifies additional bitblt effects.
     * @type {Pointer<DDBLTFX>}
     */
    lpDDBltFx {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
