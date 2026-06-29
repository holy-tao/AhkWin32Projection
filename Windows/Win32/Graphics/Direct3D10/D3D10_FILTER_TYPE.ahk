#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Types of magnification or minification sampler filters. (D3D10_FILTER_TYPE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_filter_type
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_FILTER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Point filtering used as a texture magnification or minification filter. The texel with coordinates nearest to the desired pixel value is used. The texture filter to be used between mipmap levels is nearest-point mipmap filtering. The rasterizer uses the color from the texel of the nearest mipmap texture.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_TYPE_POINT => 0

    /**
     * Bilinear interpolation filtering used as a texture magnification or minification filter. A weighted average of a 2 x 2 area of texels surrounding the desired pixel is used. The texture filter to use between mipmap levels is trilinear mipmap interpolation. The rasterizer linearly interpolates pixel color, using the texels of the two nearest mipmap textures.
     * @type {Integer (Int32)}
     */
    static D3D10_FILTER_TYPE_LINEAR => 1
}
