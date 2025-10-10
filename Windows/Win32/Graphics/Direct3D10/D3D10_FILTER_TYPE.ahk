#Requires AutoHotkey v2.0.0 64-bit

/**
 * Types of magnification or minification sampler filters.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_filter_type
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_FILTER_TYPE{

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
