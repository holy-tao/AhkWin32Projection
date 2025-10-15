#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RASTERIZER_DESC2 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    FillMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CullMode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    FrontCounterClockwise{
        get {
            if(!this.HasProp("__FrontCounterClockwise"))
                this.__FrontCounterClockwise := BOOL(this.ptr + 8)
            return this.__FrontCounterClockwise
        }
    }

    /**
     * @type {Float}
     */
    DepthBias {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * @type {Float}
     */
    DepthBiasClamp {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * @type {Float}
     */
    SlopeScaledDepthBias {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * @type {BOOL}
     */
    DepthClipEnable{
        get {
            if(!this.HasProp("__DepthClipEnable"))
                this.__DepthClipEnable := BOOL(this.ptr + 24)
            return this.__DepthClipEnable
        }
    }

    /**
     * @type {Integer}
     */
    LineRasterizationMode {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    ForcedSampleCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ConservativeRaster {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
