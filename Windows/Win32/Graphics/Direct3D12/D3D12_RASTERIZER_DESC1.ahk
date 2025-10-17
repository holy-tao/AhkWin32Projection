#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RASTERIZER_DESC1 extends Win32Struct
{
    static sizeof => 44

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
    FrontCounterClockwise {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
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
    DepthClipEnable {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    MultisampleEnable {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {BOOL}
     */
    AntialiasedLineEnable {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ForcedSampleCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ConservativeRaster {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
