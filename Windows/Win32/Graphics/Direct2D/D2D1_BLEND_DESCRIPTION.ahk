#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_BLEND.ahk" { D2D1_BLEND }
#Import ".\D2D1_BLEND_OPERATION.ahk" { D2D1_BLEND_OPERATION }

/**
 * Defines a blend description to be used in a particular blend transform.
 * @remarks
 * This description closely matches the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">D3D11_BLEND_DESC</a> struct with some omissions and the addition of the blend factor in the description.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_blend_description
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BLEND_DESCRIPTION {
    #StructPack 4

    /**
     * Specifies the first RGB data source and includes an optional preblend operation.
     */
    sourceBlend : D2D1_BLEND

    /**
     * Specifies the second RGB data source and includes an optional preblend operation.
     */
    destinationBlend : D2D1_BLEND

    /**
     * Specifies how to combine the RGB data sources.
     */
    blendOperation : D2D1_BLEND_OPERATION

    /**
     * Specifies the first alpha data source and includes an optional preblend operation. Blend options that end in _COLOR are not allowed.
     */
    sourceBlendAlpha : D2D1_BLEND

    /**
     * Specifies the second alpha data source and includes an optional preblend operation. Blend options that end in _COLOR are not allowed.
     */
    destinationBlendAlpha : D2D1_BLEND

    /**
     * Specifies how to combine the alpha data sources.
     */
    blendOperationAlpha : D2D1_BLEND_OPERATION

    /**
     * Parameters to the blend operations. The blend must use <b>D2D1_BLEND_BLEND_FACTOR</b> for this to be used.
     */
    blendFactor : Float32[4]

}
