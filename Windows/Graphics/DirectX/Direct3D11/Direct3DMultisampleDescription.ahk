#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This is a Windows Runtime equivalent of the Desktop [DXGI_SAMPLE_DESC](/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc) structure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.direct3dmultisampledescription
 * @namespace Windows.Graphics.DirectX.Direct3D11
 * @version WindowsRuntime 1.4
 */
class Direct3DMultisampleDescription extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of multisamples per pixel.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The image quality level. The higher the quality, the lower the performance.
     * @type {Integer}
     */
    Quality {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
