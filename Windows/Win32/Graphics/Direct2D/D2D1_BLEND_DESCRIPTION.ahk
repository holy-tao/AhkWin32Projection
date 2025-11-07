#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a blend description to be used in a particular blend transform.
 * @remarks
 * 
 * This description closely matches the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a> struct with some omissions and the addition of the blend factor in the description.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ns-d2d1effectauthor-d2d1_blend_description
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BLEND_DESCRIPTION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * Specifies the first RGB data source and includes an optional preblend operation.
     * @type {Integer}
     */
    sourceBlend {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the second RGB data source and includes an optional preblend operation.
     * @type {Integer}
     */
    destinationBlend {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies how to combine the RGB data sources.
     * @type {Integer}
     */
    blendOperation {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies the first alpha data source and includes an optional preblend operation. Blend options that end in _COLOR are not allowed.
     * @type {Integer}
     */
    sourceBlendAlpha {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies the second alpha data source and includes an optional preblend operation. Blend options that end in _COLOR are not allowed.
     * @type {Integer}
     */
    destinationBlendAlpha {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies how to combine the alpha data sources.
     * @type {Integer}
     */
    blendOperationAlpha {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Parameters to the blend operations. The blend must use <b>D2D1_BLEND_BLEND_FACTOR</b> for this to be used.
     * @type {Array<Single>}
     */
    blendFactor{
        get {
            if(!this.HasProp("__blendFactorProxyArray"))
                this.__blendFactorProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "float")
            return this.__blendFactorProxyArray
        }
    }
}
