#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This is a Windows Runtime equivalent of the Desktop [DXGI_SURFACE_DESC](/windows/win32/api/dxgi/ns-dxgi-dxgi_surface_desc) structure. Describes an [IDirect3DSurface](idirect3dsurface.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.direct3dsurfacedescription
 * @namespace Windows.Graphics.DirectX.Direct3D11
 * @version WindowsRuntime 1.4
 */
class Direct3DSurfaceDescription extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Width of the surface.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Height of the surface.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Pixel format of the surface.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Multi-sampling parameters for the surface.
     * @type {Pointer<Direct3DMultisampleDescription>}
     */
    MultisampleDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
