#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include Common\DXGI_ALPHA_MODE.ahk
#Include Common\DXGI_COLOR_SPACE_TYPE.ahk
#Include Common\DXGI_FORMAT.ahk
#Include Common\DXGI_SAMPLE_DESC.ahk
#Include .\DXGI_SCALING.ahk
#Include .\DXGI_SWAP_EFFECT.ahk
#Include .\DXGI_USAGE.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 */
class DXGI_SWAP_CHAIN_DESC2 extends Win32Struct {
    static sizeof => 52

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DXGI_FORMAT}
     */
    Format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    Stereo {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {DXGI_SAMPLE_DESC}
     */
    SampleDesc {
        get {
            if(!this.HasProp("__SampleDesc"))
                this.__SampleDesc := DXGI_SAMPLE_DESC(16, this)
            return this.__SampleDesc
        }
    }

    /**
     * @type {DXGI_USAGE}
     */
    BufferUsage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    BufferCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {DXGI_SCALING}
     */
    Scaling {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {DXGI_SWAP_EFFECT}
     */
    SwapEffect {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {DXGI_ALPHA_MODE}
     */
    AlphaMode {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {DXGI_COLOR_SPACE_TYPE}
     */
    ColorSpace {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
