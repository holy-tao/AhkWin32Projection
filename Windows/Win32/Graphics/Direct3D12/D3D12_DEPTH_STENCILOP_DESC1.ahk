#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_STENCIL_OP.ahk
#Include .\D3D12_COMPARISON_FUNC.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEPTH_STENCILOP_DESC1 extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {D3D12_STENCIL_OP}
     */
    StencilFailOp {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_STENCIL_OP}
     */
    StencilDepthFailOp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_STENCIL_OP}
     */
    StencilPassOp {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3D12_COMPARISON_FUNC}
     */
    StencilFunc {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    StencilReadMask {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    StencilWriteMask {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }
}
