#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies texture layout options.
 * @remarks
 * 
  * This enumeration controls the swizzle pattern of default textures and enable map support on default textures.  Callers must query <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options2">D3D11_FEATURE_DATA_D3D11_OPTIONS2</a> to ensure that each option is supported.
  * 
  * The standard swizzle formats applies within each page-sized chunk, and pages are laid out in linear order with respect to one another.  A 16-bit interleave pattern defines the conversion from pre-swizzled intra-page location to the post-swizzled location.  
  * 
  * <img alt="Standard swizzle patterns" src="./images/d3d11_standardswizzle.png"/>
  * To demonstrate, consider the 32bpp swizzle format above.  This is represented by the following interleave masks, where bits on the left are most-significant.
  * 
  * <pre class="syntax" xml:space="preserve"><code>UINT xBytesMask = 1010 1010 1000 1111
  * UINT yMask =      0101 0101 0111 0000
  * </code></pre>
  * To compute the swizzled address, the following code could be used (where the _pdep_u32 instruction is supported):
  * 
  * <pre class="syntax" xml:space="preserve"><code>UINT swizzledOffset = resourceBaseOffset +
  *                       _pdep_u32(xOffset, xBytesMask) + 
  *                       _pdep_u32(yOffset, yBytesMask);
  * </code></pre>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/ne-d3d11_3-d3d11_texture_layout
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_TEXTURE_LAYOUT{

    /**
     * The texture layout is undefined, and is selected by the driver.
     * @type {Integer (Int32)}
     */
    static D3D11_TEXTURE_LAYOUT_UNDEFINED => 0

    /**
     * Data for the texture is stored in row major (sometimes called pitch-linear) order.
     * @type {Integer (Int32)}
     */
    static D3D11_TEXTURE_LAYOUT_ROW_MAJOR => 1

    /**
     * A default texture uses the standardized swizzle pattern.
     * @type {Integer (Int32)}
     */
    static D3D11_TEXTURE_LAYOUT_64K_STANDARD_SWIZZLE => 2
}
