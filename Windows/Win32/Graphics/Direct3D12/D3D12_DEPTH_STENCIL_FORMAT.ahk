#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEPTH_STENCIL_FORMAT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DepthStencilFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
