#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_STENCIL_OP.ahk
#Include .\D3D12_DEPTH_STENCILOP_DESC1.ahk
#Include .\D3D12_DEPTH_WRITE_MASK.ahk
#Include .\D3D12_COMPARISON_FUNC.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEPTH_STENCIL_DESC2 extends Win32Struct {
    static sizeof => 60

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    DepthEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_DEPTH_WRITE_MASK}
     */
    DepthWriteMask {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_COMPARISON_FUNC}
     */
    DepthFunc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    StencilEnable {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {D3D12_DEPTH_STENCILOP_DESC1}
     */
    FrontFace {
        get {
            if(!this.HasProp("__FrontFace"))
                this.__FrontFace := D3D12_DEPTH_STENCILOP_DESC1(16, this)
            return this.__FrontFace
        }
    }

    /**
     * @type {D3D12_DEPTH_STENCILOP_DESC1}
     */
    BackFace {
        get {
            if(!this.HasProp("__BackFace"))
                this.__BackFace := D3D12_DEPTH_STENCILOP_DESC1(36, this)
            return this.__BackFace
        }
    }

    /**
     * @type {BOOL}
     */
    DepthBoundsTestEnable {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
