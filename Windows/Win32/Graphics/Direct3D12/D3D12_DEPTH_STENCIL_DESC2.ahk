#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_DEPTH_STENCILOP_DESC1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEPTH_STENCIL_DESC2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    DepthEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DepthWriteMask {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DepthFunc {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    StencilEnable {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {D3D12_DEPTH_STENCILOP_DESC1}
     */
    FrontFace{
        get {
            if(!this.HasProp("__FrontFace"))
                this.__FrontFace := D3D12_DEPTH_STENCILOP_DESC1(this.ptr + 16)
            return this.__FrontFace
        }
    }

    /**
     * @type {D3D12_DEPTH_STENCILOP_DESC1}
     */
    BackFace{
        get {
            if(!this.HasProp("__BackFace"))
                this.__BackFace := D3D12_DEPTH_STENCILOP_DESC1(this.ptr + 40)
            return this.__BackFace
        }
    }

    /**
     * @type {Integer}
     */
    DepthBoundsTestEnable {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
