#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Dxgi\Common\DXGI_FORMAT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEPTH_STENCIL_FORMAT extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {DXGI_FORMAT}
     */
    DepthStencilFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
