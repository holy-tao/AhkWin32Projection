#Requires AutoHotkey v2.0.0 64-bit

/**
 * Resource data formats, including fully-typed and typeless formats. A list of modifiers at the bottom of the page more fully describes each format type.
 * @remarks
 * 
 * <h3><a id="Byte_Order__LSB_MSB_"></a><a id="byte_order__lsb_msb_"></a><a id="BYTE_ORDER__LSB_MSB_"></a>Byte Order (LSB/MSB)</h3>
 * Most formats have byte-aligned components, and the components are in C-array order (the least address comes first).
 *             For those formats that don't have power-of-2-aligned components, the first named component is in the least-significant bits.
 *           
 * 
 * <h3><a id="Portable_Coding_for_Endian-Independence"></a><a id="portable_coding_for_endian-independence"></a><a id="PORTABLE_CODING_FOR_ENDIAN-INDEPENDENCE"></a>Portable Coding for Endian-Independence</h3>
 * Rather than adjusting for whether a system uses big-endian or little-endian byte ordering, you should write portable code, as follows.
 *           
 * 
 * 
 * ```
 * 
 * // DXGI_FORMAT_R32G32B32A32_FLOAT
 * FLOAT* pR32G32B32A32 = ...;
 * pR32G32B32A32[0] = 1.f;  // R
 * pR32G32B32A32[1] = 0.f;  // G
 * pR32G32B32A32[2] = 0.f;  // B
 * pR32G32B32A32[3] = 0.5f; // A
 * 
 * // DXGI_FORMAT_R10G10B10A2_UNORM
 * UINT32* pR10G10B10A2 = ...;
 * pR10G10B10A2 = (0x3ff) | (0x1 << 30);  // R=0x3ff, and A=0x1
 * 
 * ```
 * 
 * 
 * <h3><a id="Restrictions_and_notes_on_formats"></a><a id="restrictions_and_notes_on_formats"></a><a id="RESTRICTIONS_AND_NOTES_ON_FORMATS"></a>Restrictions and notes on formats</h3>
 * A few formats have additional restrictions and implied behavior:
 * 
 * <ol>
 * <li>A resource declared with the DXGI_FORMAT_R32G32B32 family of formats cannot be used simultaneously for vertex and texture data.
 *               That is, you may not create a buffer resource with the DXGI_FORMAT_R32G32B32 family of formats that uses any of the following bind flags:
 *               D3D10_BIND_VERTEX_BUFFER, D3D10_BIND_INDEX_BUFFER, D3D10_BIND_CONSTANT_BUFFER, or D3D10_BIND_STREAM_OUTPUT
 *               (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">D3D10_BIND_FLAG</a>).
 *             </li>
 * <li>DXGI_FORMAT_R1_UNORM is designed specifically for text filtering, and must be used with a format-specific, configurable 8x8 filter mode.
 *               When calling an HLSL sampling function using this format, the address offset parameter must be set to (0,0).
 *             </li>
 * <li>A resource using a sub-sampled format (such as DXGI_FORMAT_R8G8_B8G8) must have a size that is a multiple of 2 in the x dimension.
 *             </li>
 * <li>Format is not available in Direct3D 10 and Direct3D 10.1
 *             </li>
 * <li>These float formats have an implied 1 added to their mantissa. If the exponent is not 0, 1.0 is added to the mantissa before applying the exponent. </li>
 * <li>These float formats do not have an implied 1 added to their mantissa. </li>
 * <li>Denorm support: the 9, 10, 11 and 16 bit float formats support denorms.</li>
 * <li>No denorm support: the 32 and 64 bit float formats flush denorms to zero. </li>
 * </ol>
 * The following topics provide lists of the formats that particular hardware <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> support:
 *             
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-1-formats">DXGI Format  Support for Direct3D Feature Level 12.1 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-0-formats">DXGI Format  Support for Direct3D Feature Level 12.0 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-1-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.1 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-0-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.0 Hardware</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/ff471324(v=vs.85)">Hardware Support for Direct3D 10Level9 Formats</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-1-hardware">Hardware Support for Direct3D 10.1 Formats</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-0-hardware">Hardware Support for Direct3D 10 Formats</a>
 * </li>
 * </ul>
 * For a list of the <b>DirectXMath</b> types that map to <b>DXGI_FORMAT</b> values, see <a href="https://docs.microsoft.com/windows/desktop/dxmath/pg-xnamath-internals">DirectXMath Library Internals</a>.
 *           
 * 
 * <h3><a id="Format_Modifiers"></a><a id="format_modifiers"></a><a id="FORMAT_MODIFIERS"></a>Format Modifiers</h3>
 * Each enumeration value contains a format modifier which describes the data type.
 * 
 * <table>
 * <tr>
 * <th>Format Modifiers</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>_FLOAT</td>
 * <td>A floating-point value; 32-bit floating-point formats use IEEE 754 single-precision (s23e8 format): sign bit, 8-bit biased (127) exponent,
 *                 and 23-bit mantissa. 16-bit floating-point formats use half-precision (s10e5 format): sign bit, 5-bit biased (15) exponent, and 10-bit mantissa.
 *               </td>
 * </tr>
 * <tr>
 * <td>_SINT</td>
 * <td>Two's complement signed integer. For example, a 3-bit SINT represents the values -4, -3, -2, -1, 0, 1, 2, 3.</td>
 * </tr>
 * <tr>
 * <td>_SNORM</td>
 * <td>Signed normalized integer; which is interpreted in a resource as a signed integer, and is interpreted in a shader as a signed normalized floating-point value in the range [-1, 1]. For an 2's complement number, the maximum value is 1.0f (a 5-bit value 01111 maps to 1.0f), and the minimum value is -1.0f (a 5-bit value 10000 maps to -1.0f). In addition, the second-minimum number maps to -1.0f (a 5-bit value 10001 maps to -1.0f). The resulting integer representations are evenly spaced floating-point values in the range (-1.0f...0.0f), and also a complementary set of representations for numbers in the range (0.0f...1.0f).</td>
 * </tr>
 * <tr>
 * <td>_SRGB</td>
 * <td>
 * Standard RGB data, which roughly displays colors in a linear ramp of luminosity levels such that an average observer, under average viewing conditions, can view them on an average display.
 * 
 * All 0's maps to 0.0f, and all 1's maps to 1.0f. The sequence of unsigned integer encodings between all 0's and all 1's represent a nonlinear progression in the floating-point interpretation of the numbers between 0.0f to 1.0f. For more detail, see the SRGB color standard, IEC 61996-2-1, at IEC (International Electrotechnical Commission).</p>Conversion to or from sRGB space is automatically done by D3DX10 or D3DX9 texture-load functions. If a format with _SRGB has an A channel, the A channel is stored in Gamma 1.0f data; the R, G, and B channels in the format are stored in Gamma 2.2f data.</td>
 * </tr>
 * <tr>
 * <td>_TYPELESS</td>
 * <td>Typeless data, with a defined number of bits. Typeless formats are designed for creating typeless resources; that is, a resource whose size is known, but whose data type is not yet fully defined. When a typeless resource is bound to a shader, the application or shader must resolve the format type (which must match the number of bits per component in the typeless format).
 * 
 * A typeless format contains one or more subformats; each subformat resolves the data type. 
 *   For example, in the R32G32B32 group, which defines types for three-component 96-bit data, there is one typeless format and three fully typed subformats.
 * 
 * 
 * 
 * ```
 * 
 * DXGI_FORMAT_R32G32B32_TYPELESS,
 * DXGI_FORMAT_R32G32B32_FLOAT,
 * DXGI_FORMAT_R32G32B32_UINT,
 * DXGI_FORMAT_R32G32B32_SINT,
 * 
 * ```
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>_UINT</td>
 * <td>Unsigned integer. For instance, a 3-bit UINT represents the values 0, 1, 2, 3, 4, 5, 6, 7.</td>
 * </tr>
 * <tr>
 * <td>_UNORM</td>
 * <td>Unsigned normalized integer; which is interpreted in a resource as an unsigned integer, and is interpreted in a shader as an unsigned normalized floating-point value in the range [0, 1]. All 0's maps to 0.0f, and all 1's maps to 1.0f. A sequence of evenly spaced floating-point values from 0.0f to 1.0f are represented. For instance, a 2-bit UNORM represents 0.0f, 1/3, 2/3, and 1.0f.</td>
 * </tr>
 * <tr>
 * <td>_SHAREDEXP</td>
 * <td>A shared exponent. All the floating point representations in the format share the one exponent.</td>
 * </tr>
 * </table>
 *  
 * 
 * <h3><a id="New_Resource_Formats"></a><a id="new_resource_formats"></a><a id="NEW_RESOURCE_FORMATS"></a>New Resource Formats</h3>
 * Direct3D 10 offers new data compression formats for compressing high-dynamic range (HDR) lighting data, normal maps and heightfields to a fraction of their original size. These compression types include:
 *           
 * 
 * <ul>
 * <li>Shared-Exponent high-dynamic range (HDR) format (RGBE)</li>
 * <li>New Block-Compressed 1-2 channel UNORM/SNORM formats</li>
 * </ul>
 * The block compression formats can be used for any of the 2D or 3D texture types ( Texture2D, Texture2DArray, Texture3D, or TextureCube) including mipmap surfaces. The block compression techniques require texture dimensions to be a multiple of 4 (since the implementation compresses on blocks of 4x4 texels). In the texture sampler, compressed formats are always decompressed before texture filtering.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgiformat/ne-dxgiformat-dxgi_format
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_FORMAT{

    /**
     * The format is not known.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_UNKNOWN => 0

    /**
     * A four-component, 128-bit typeless format that supports 32 bits per channel including alpha. ¹
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32A32_TYPELESS => 1

    /**
     * A four-component, 128-bit floating-point format that supports 32 bits per channel including alpha. <sup>1,5,8</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32A32_FLOAT => 2

    /**
     * A four-component, 128-bit unsigned-integer format that supports 32 bits per channel including alpha. ¹
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32A32_UINT => 3

    /**
     * A four-component, 128-bit signed-integer format that supports 32 bits per channel including alpha. ¹
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32A32_SINT => 4

    /**
     * A three-component, 96-bit typeless format that supports 32 bits per color channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32_TYPELESS => 5

    /**
     * A three-component, 96-bit floating-point format that supports 32 bits per color channel.<sup>5,8</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32_FLOAT => 6

    /**
     * A three-component, 96-bit unsigned-integer format that supports 32 bits per color channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32_UINT => 7

    /**
     * A three-component, 96-bit signed-integer format that supports 32 bits per color channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32B32_SINT => 8

    /**
     * A four-component, 64-bit typeless format that supports 16 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16B16A16_TYPELESS => 9

    /**
     * A four-component, 64-bit floating-point format that supports 16 bits per channel including alpha.<sup>5,7</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16B16A16_FLOAT => 10

    /**
     * A four-component, 64-bit unsigned-normalized-integer format that supports 16 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16B16A16_UNORM => 11

    /**
     * A four-component, 64-bit unsigned-integer format that supports 16 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16B16A16_UINT => 12

    /**
     * A four-component, 64-bit signed-normalized-integer format that supports 16 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16B16A16_SNORM => 13

    /**
     * A four-component, 64-bit signed-integer format that supports 16 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16B16A16_SINT => 14

    /**
     * A two-component, 64-bit typeless format that supports 32 bits for the red channel and 32 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32_TYPELESS => 15

    /**
     * A two-component, 64-bit floating-point format that supports 32 bits for the red channel and 32 bits for the green channel.<sup>5,8</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32_FLOAT => 16

    /**
     * A two-component, 64-bit unsigned-integer format that supports 32 bits for the red channel and 32 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32_UINT => 17

    /**
     * A two-component, 64-bit signed-integer format that supports 32 bits for the red channel and 32 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G32_SINT => 18

    /**
     * A two-component, 64-bit typeless format that supports 32 bits for the red channel, 8 bits for the green channel, and 24 bits are unused.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32G8X24_TYPELESS => 19

    /**
     * A 32-bit floating-point component, and two unsigned-integer components (with an additional 32 bits). This format supports 32-bit depth, 8-bit stencil, and 24 bits are unused.⁵
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_D32_FLOAT_S8X24_UINT => 20

    /**
     * A 32-bit floating-point component, and two typeless components (with an additional 32 bits). This format supports 32-bit red channel, 8 bits are unused, and 24 bits are unused.⁵
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32_FLOAT_X8X24_TYPELESS => 21

    /**
     * A 32-bit typeless component, and two unsigned-integer components (with an additional 32 bits). This format has 32 bits unused, 8 bits for green channel, and 24 bits are unused.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_X32_TYPELESS_G8X24_UINT => 22

    /**
     * A four-component, 32-bit typeless format that supports 10 bits for each color and 2 bits for alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R10G10B10A2_TYPELESS => 23

    /**
     * A four-component, 32-bit unsigned-normalized-integer format that supports 10 bits for each color and 2 bits for alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R10G10B10A2_UNORM => 24

    /**
     * A four-component, 32-bit unsigned-integer format that supports 10 bits for each color and 2 bits for alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R10G10B10A2_UINT => 25

    /**
     * Three partial-precision floating-point numbers encoded into a single 32-bit value (a variant of s10e5, which is sign bit, 10-bit mantissa, and 5-bit biased (15) exponent). 
 *         There are no sign bits, and there is a 5-bit biased (15) exponent for each channel, 6-bit mantissa  for R and G, and a 5-bit mantissa for B, as shown in the following illustration.<sup>5,7</sup>
 * 
 * <img alt="Illustration of the bits in the three partial-precision floating-point numbers" src="./images/R11G11B10_FLOAT.png"/>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R11G11B10_FLOAT => 26

    /**
     * A four-component, 32-bit typeless format that supports 8 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8B8A8_TYPELESS => 27

    /**
     * A four-component, 32-bit unsigned-normalized-integer format that supports 8 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8B8A8_UNORM => 28

    /**
     * A four-component, 32-bit unsigned-normalized integer sRGB format that supports 8 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8B8A8_UNORM_SRGB => 29

    /**
     * A four-component, 32-bit unsigned-integer format that supports 8 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8B8A8_UINT => 30

    /**
     * A four-component, 32-bit signed-normalized-integer format that supports 8 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8B8A8_SNORM => 31

    /**
     * A four-component, 32-bit signed-integer format that supports 8 bits per channel including alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8B8A8_SINT => 32

    /**
     * A two-component, 32-bit typeless format that supports 16 bits for the red channel and 16 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16_TYPELESS => 33

    /**
     * A two-component, 32-bit floating-point format that supports 16 bits for the red channel and 16 bits for the green channel.<sup>5,7</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16_FLOAT => 34

    /**
     * A two-component, 32-bit unsigned-normalized-integer format that supports 16 bits each for the green and red channels.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16_UNORM => 35

    /**
     * A two-component, 32-bit unsigned-integer format that supports 16 bits for the red channel and 16 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16_UINT => 36

    /**
     * A two-component, 32-bit signed-normalized-integer format that supports 16 bits for the red channel and 16 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16_SNORM => 37

    /**
     * A two-component, 32-bit signed-integer format that supports 16 bits for the red channel and 16 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16G16_SINT => 38

    /**
     * A single-component, 32-bit typeless format that supports 32 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32_TYPELESS => 39

    /**
     * A single-component, 32-bit floating-point format that supports 32 bits for depth.<sup>5,8</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_D32_FLOAT => 40

    /**
     * A single-component, 32-bit floating-point format that supports 32 bits for the red channel.<sup>5,8</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32_FLOAT => 41

    /**
     * A single-component, 32-bit unsigned-integer format that supports 32 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32_UINT => 42

    /**
     * A single-component, 32-bit signed-integer format that supports 32 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R32_SINT => 43

    /**
     * A two-component, 32-bit typeless format that supports 24 bits for the red channel and 8 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R24G8_TYPELESS => 44

    /**
     * A 32-bit z-buffer format that supports 24 bits for depth and 8 bits for stencil.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_D24_UNORM_S8_UINT => 45

    /**
     * A 32-bit format, that contains a 24 bit, single-component, unsigned-normalized integer, with an additional typeless 8 bits. This format has 24 bits red channel and 8 bits unused.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R24_UNORM_X8_TYPELESS => 46

    /**
     * A 32-bit format, that contains a 24 bit, single-component, typeless format,  with an additional 8 bit unsigned integer component. This format has 24 bits unused and 8 bits green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_X24_TYPELESS_G8_UINT => 47

    /**
     * A two-component, 16-bit typeless format that supports 8 bits for the red channel and 8 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8_TYPELESS => 48

    /**
     * A two-component, 16-bit unsigned-normalized-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8_UNORM => 49

    /**
     * A two-component, 16-bit unsigned-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8_UINT => 50

    /**
     * A two-component, 16-bit signed-normalized-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8_SNORM => 51

    /**
     * A two-component, 16-bit signed-integer format that supports 8 bits for the red channel and 8 bits for the green channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8_SINT => 52

    /**
     * A single-component, 16-bit typeless format that supports 16 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16_TYPELESS => 53

    /**
     * A single-component, 16-bit floating-point format that supports 16 bits for the red channel.<sup>5,7</sup>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16_FLOAT => 54

    /**
     * A single-component, 16-bit unsigned-normalized-integer format that supports 16 bits for depth.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_D16_UNORM => 55

    /**
     * A single-component, 16-bit unsigned-normalized-integer format that supports 16 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16_UNORM => 56

    /**
     * A single-component, 16-bit unsigned-integer format that supports 16 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16_UINT => 57

    /**
     * A single-component, 16-bit signed-normalized-integer format that supports 16 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16_SNORM => 58

    /**
     * A single-component, 16-bit signed-integer format that supports 16 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R16_SINT => 59

    /**
     * A single-component, 8-bit typeless format that supports 8 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8_TYPELESS => 60

    /**
     * A single-component, 8-bit unsigned-normalized-integer format that supports 8 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8_UNORM => 61

    /**
     * A single-component, 8-bit unsigned-integer format that supports 8 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8_UINT => 62

    /**
     * A single-component, 8-bit signed-normalized-integer format that supports 8 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8_SNORM => 63

    /**
     * A single-component, 8-bit signed-integer format that supports 8 bits for the red channel.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8_SINT => 64

    /**
     * A single-component, 8-bit unsigned-normalized-integer format for alpha only.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_A8_UNORM => 65

    /**
     * A single-component, 1-bit unsigned-normalized integer format that supports 1 bit for the red channel. ².
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R1_UNORM => 66

    /**
     * Three partial-precision floating-point numbers encoded into a single 32-bit value all sharing the same 5-bit exponent (variant of s10e5, which is sign bit, 10-bit mantissa, and 5-bit biased (15) exponent). 
 *         There is no sign bit, and there is a shared 5-bit biased (15) exponent and a 9-bit mantissa for each channel, as shown in the following illustration. <sup>6,7</sup>.
 * 
 * <img alt="Illustration of the bits in the three partial-precision floating-point numbers" src="./images/RGBE.png"/>
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R9G9B9E5_SHAREDEXP => 67

    /**
     * A four-component, 32-bit unsigned-normalized-integer format. This packed RGB format is analogous to the UYVY format. Each 32-bit block describes a pair of pixels: (R8, G8, B8) and (R8, G8, B8) where the R8/B8 values are repeated, and the G8 values are unique to each pixel. ³
 * 
 * Width must be even.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R8G8_B8G8_UNORM => 68

    /**
     * A four-component, 32-bit unsigned-normalized-integer format. This packed RGB format is analogous to the YUY2 format. Each 32-bit block describes a pair of pixels: (R8, G8, B8) and (R8, G8, B8) where the R8/B8 values are repeated, and the G8 values are unique to each pixel. ³
 * 
 * Width must be even.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_G8R8_G8B8_UNORM => 69

    /**
     * Four-component typeless block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC1_TYPELESS => 70

    /**
     * Four-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC1_UNORM => 71

    /**
     * Four-component block-compression format for sRGB data. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC1_UNORM_SRGB => 72

    /**
     * Four-component typeless block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC2_TYPELESS => 73

    /**
     * Four-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC2_UNORM => 74

    /**
     * Four-component block-compression format for sRGB data. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC2_UNORM_SRGB => 75

    /**
     * Four-component typeless block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC3_TYPELESS => 76

    /**
     * Four-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC3_UNORM => 77

    /**
     * Four-component block-compression format for sRGB data. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC3_UNORM_SRGB => 78

    /**
     * One-component typeless block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC4_TYPELESS => 79

    /**
     * One-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC4_UNORM => 80

    /**
     * One-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC4_SNORM => 81

    /**
     * Two-component typeless block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC5_TYPELESS => 82

    /**
     * Two-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC5_UNORM => 83

    /**
     * Two-component block-compression format. For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC5_SNORM => 84

    /**
     * A three-component, 16-bit unsigned-normalized-integer format that supports 5 bits for blue, 6 bits for green, and 5 bits for red.
 * 
 * <b>Direct3D 10 through Direct3D 11:  </b>This value is defined for DXGI. However, Direct3D 10, 10.1, or 11 devices do not support this format.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B5G6R5_UNORM => 85

    /**
     * A four-component, 16-bit unsigned-normalized-integer format that supports 5 bits for each color channel and 1-bit alpha.
 * 
 * <b>Direct3D 10 through Direct3D 11:  </b>This value is defined for DXGI. However, Direct3D 10, 10.1, or 11 devices do not support this format.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B5G5R5A1_UNORM => 86

    /**
     * A four-component, 32-bit unsigned-normalized-integer format that supports 8 bits for each color channel and 8-bit alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B8G8R8A8_UNORM => 87

    /**
     * A four-component, 32-bit unsigned-normalized-integer format that supports 8 bits for each color channel and 8 bits unused.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B8G8R8X8_UNORM => 88

    /**
     * A four-component, 32-bit 2.8-biased fixed-point format that supports 10 bits for each color channel and 2-bit alpha.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_R10G10B10_XR_BIAS_A2_UNORM => 89

    /**
     * A four-component, 32-bit typeless format that supports 8 bits for each channel including alpha. ⁴
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B8G8R8A8_TYPELESS => 90

    /**
     * A four-component, 32-bit unsigned-normalized standard RGB format that supports 8 bits for each channel including alpha. ⁴
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B8G8R8A8_UNORM_SRGB => 91

    /**
     * A four-component, 32-bit typeless format that supports 8 bits for each color channel, and 8 bits are unused. ⁴
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B8G8R8X8_TYPELESS => 92

    /**
     * A four-component, 32-bit unsigned-normalized standard RGB format that supports 8 bits for each color channel, and 8 bits are unused. ⁴
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B8G8R8X8_UNORM_SRGB => 93

    /**
     * A typeless block-compression format. ⁴ For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC6H_TYPELESS => 94

    /**
     * A block-compression format. ⁴ For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.⁵
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC6H_UF16 => 95

    /**
     * A block-compression format. ⁴ For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.⁵
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC6H_SF16 => 96

    /**
     * A typeless block-compression format. ⁴ For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC7_TYPELESS => 97

    /**
     * A block-compression format. ⁴ For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC7_UNORM => 98

    /**
     * A block-compression format. ⁴ For information about block-compression formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/texture-block-compression-in-direct3d-11">Texture Block Compression in Direct3D 11</a>.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_BC7_UNORM_SRGB => 99

    /**
     * Most common YUV 4:4:4 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. For UAVs, an additional valid view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. Supported view types are SRV, RTV, and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is V-&gt;R8, 
 * U-&gt;G8, 
 * Y-&gt;B8, 
 * and A-&gt;A8.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_AYUV => 100

    /**
     * 10-bit per channel packed YUV 4:4:4 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R10G10B10A2_UNORM and DXGI_FORMAT_R10G10B10A2_UINT. For UAVs, an additional valid view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R10G10B10A2_UNORM and DXGI_FORMAT_R10G10B10A2_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is U-&gt;R10,
 * Y-&gt;G10,
 * V-&gt;B10,
 * and A-&gt;A2.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_Y410 => 101

    /**
     * 16-bit per channel packed YUV 4:4:4 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R16G16B16A16_UNORM and DXGI_FORMAT_R16G16B16A16_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is U-&gt;R16,
 * Y-&gt;G16,
 * V-&gt;B16,
 * and A-&gt;A16.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_Y416 => 102

    /**
     * Most common YUV 4:2:0 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R8_UNORM and DXGI_FORMAT_R8_UINT. Valid chrominance data view formats (width and height are each 1/2 of luminance view) for this video resource format are DXGI_FORMAT_R8G8_UNORM and DXGI_FORMAT_R8G8_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y-&gt;R8. For chrominance data view, the mapping to the view channel is U-&gt;R8 and
 * V-&gt;G8.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. The first (SysMemPitch * height) bytes are the Y plane, the remaining (SysMemPitch * (height / 2)) bytes are the UV plane.
 * 
 * An app using the YUY 4:2:0 formats  must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_NV12 => 103

    /**
     * 10-bit per channel planar YUV 4:2:0 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R16_UNORM and DXGI_FORMAT_R16_UINT. The runtime does not enforce whether the lowest 6 bits are 0 (given that this video resource format is a 10-bit format that uses 16 bits). If required, application shader code would have to enforce this manually.  From the runtime's point of view, DXGI_FORMAT_P010 is no different than DXGI_FORMAT_P016. Valid chrominance data view formats (width and height are each 1/2 of luminance view) for this video resource format are DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. For UAVs, an additional valid chrominance data view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y-&gt;R16. For chrominance data view, the mapping to the view channel is U-&gt;R16 and
 * V-&gt;G16.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. The first (SysMemPitch * height) bytes are the Y plane, the remaining (SysMemPitch * (height / 2)) bytes are the UV plane.
 * 
 * An app using the YUY 4:2:0 formats  must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_P010 => 104

    /**
     * 16-bit per channel planar YUV 4:2:0 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R16_UNORM and DXGI_FORMAT_R16_UINT. Valid chrominance data view formats (width and height are each 1/2 of luminance view) for this video resource format are DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. For UAVs, an additional valid chrominance data view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R16G16_UNORM and DXGI_FORMAT_R16G16_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y-&gt;R16. For chrominance data view, the mapping to the view channel is U-&gt;R16 and
 * V-&gt;G16.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. The first (SysMemPitch * height) bytes are the Y plane, the remaining (SysMemPitch * (height / 2)) bytes are the UV plane.
 * 
 * An app using the YUY 4:2:0 formats  must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_P016 => 105

    /**
     * 8-bit per channel planar YUV 4:2:0 video resource format. This format is subsampled where each pixel has its own Y value, but each 2x2 pixel block shares a single U and V value. The runtime requires that the width and height of all resources that are created with this format are multiples of 2. The runtime also requires that the left, right, top, and bottom members of any RECT that are used for this format are multiples of 2. This format differs from DXGI_FORMAT_NV12 in that the layout of the data within the resource is completely opaque to applications. Applications cannot use the CPU to map the resource and then access the data within the resource. You cannot use shaders with this format. Because of this behavior, legacy hardware that supports a non-NV12 4:2:0 layout (for example, YV12, and so on) can be used. Also, new hardware that has a 4:2:0 implementation better than NV12 can be used when the application does not need the data to be in a standard layout. 
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width and height must be even. Direct3D 11 staging resources and initData parameters for this format use (rowPitch * (height + (height / 2))) bytes. 
 * 
 * An app using the YUY 4:2:0 formats  must map the luma (Y) plane separately from the chroma (UV) planes. Developers do this by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createshaderresourceview">ID3D12Device::CreateShaderResourceView</a> twice for the same texture and passing in 1-channel and 2-channel formats. Passing in a 1-channel format compatible with the Y plane maps only the Y plane. Passing in a 2-channel format compatible with the UV planes (together) maps only the U and V planes as a single resource view.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_420_OPAQUE => 106

    /**
     * Most common YUV 4:2:2 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. For UAVs, an additional valid view format is DXGI_FORMAT_R32_UINT. By using DXGI_FORMAT_R32_UINT for UAVs, you can both read and write as opposed to just write for DXGI_FORMAT_R8G8B8A8_UNORM and DXGI_FORMAT_R8G8B8A8_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is Y0-&gt;R8, 
 * U0-&gt;G8, 
 * Y1-&gt;B8, 
 * and V0-&gt;A8.
 * 
 * A unique valid view format for this video resource format is DXGI_FORMAT_R8G8_B8G8_UNORM. With this view format, the width of the view appears to be twice what the DXGI_FORMAT_R8G8B8A8_UNORM or DXGI_FORMAT_R8G8B8A8_UINT view would be when hardware reconstructs RGBA automatically on read and before filtering.  This Direct3D hardware behavior is legacy and is likely not useful any more. With this view format, the mapping to the view channel is Y0-&gt;R8, 
 * U0-&gt;
 * G8[0], 
 * Y1-&gt;B8, 
 * and V0-&gt;
 * G8[1].
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width must be even.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_YUY2 => 107

    /**
     * 10-bit per channel packed YUV 4:2:2 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R16G16B16A16_UNORM and DXGI_FORMAT_R16G16B16A16_UINT. The runtime does not enforce whether the lowest 6 bits are 0 (given that this video resource format is a 10-bit format that uses 16 bits). If required, application shader code would have to enforce this manually.  From the runtime's point of view, DXGI_FORMAT_Y210 is no different than DXGI_FORMAT_Y216. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is Y0-&gt;R16,
 * U-&gt;G16,
 * Y1-&gt;B16,
 * and V-&gt;A16.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width must be even.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_Y210 => 108

    /**
     * 16-bit per channel packed YUV 4:2:2 video resource format. Valid view formats for this video resource format are DXGI_FORMAT_R16G16B16A16_UNORM and DXGI_FORMAT_R16G16B16A16_UINT. Supported view types are SRV and UAV. One view provides a straightforward mapping of the entire surface. The mapping to the view channel is Y0-&gt;R16,
 * U-&gt;G16,
 * Y1-&gt;B16,
 * and V-&gt;A16.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width must be even.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_Y216 => 109

    /**
     * Most common planar YUV 4:1:1 video resource format. Valid luminance data view formats for this video resource format are DXGI_FORMAT_R8_UNORM and DXGI_FORMAT_R8_UINT. Valid chrominance data view formats (width and height are each 1/4 of luminance view) for this video resource format are DXGI_FORMAT_R8G8_UNORM and DXGI_FORMAT_R8G8_UINT. Supported view types are SRV, RTV, and UAV. For luminance data view, the mapping to the view channel is Y-&gt;R8. For chrominance data view, the mapping to the view channel is U-&gt;R8 and
 * V-&gt;G8.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * Width must be a multiple of 4. Direct3D11 staging resources and initData parameters for this format use (rowPitch * height * 2) bytes. The first (SysMemPitch * height) bytes are the Y plane, the next ((SysMemPitch / 2) * height) bytes are the UV plane, and the remainder is padding. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_NV11 => 110

    /**
     * 4-bit palletized YUV format that is commonly used for DVD subpicture.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_AI44 => 111

    /**
     * 4-bit palletized YUV format that is commonly used for DVD subpicture.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_IA44 => 112

    /**
     * 8-bit palletized format that is used for palletized RGB data when the processor processes ISDB-T data and for palletized YUV data when the processor processes BluRay data.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_P8 => 113

    /**
     * 8-bit palletized format with 8 bits of alpha that is used for palletized YUV data when the processor processes BluRay data.
 * 
 * For more info about YUV formats for video rendering, see <a href="https://docs.microsoft.com/windows/desktop/medfound/recommended-8-bit-yuv-formats-for-video-rendering">Recommended 8-Bit YUV Formats for Video Rendering</a>. 
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_A8P8 => 114

    /**
     * A four-component, 16-bit unsigned-normalized integer format that supports 4 bits for each channel including alpha.
 * 
 * <b>Direct3D 11.1:  </b>This value is not supported until Windows 8.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_B4G4R4A4_UNORM => 115

    /**
     * A video format; an 8-bit version of a hybrid planar 4:2:2 format.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_P208 => 130

    /**
     * An 8 bit YCbCrA 4:4 rendering format.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_V208 => 131

    /**
     * An 8 bit YCbCrA 4:4:4:4 rendering format.
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_V408 => 132

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_SAMPLER_FEEDBACK_MIN_MIP_OPAQUE => 189

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE => 190

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_FORMAT_A4B4G4R4_UNORM => 191
}
