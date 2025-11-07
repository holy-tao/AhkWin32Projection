#Requires AutoHotkey v2.0.0 64-bit

/**
 * Blend factors, which modulate values for the pixel shader and render target.
 * @remarks
 * 
 * Blend operations are specified in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_blend_desc">blend description</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_blend
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_BLEND{

    /**
     * The blend factor is (0, 0, 0, 0). No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_ZERO => 1

    /**
     * The blend factor is (1, 1, 1, 1). No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_ONE => 2

    /**
     * The blend factor is (Rₛ, Gₛ, Bₛ, Aₛ), that is color data (RGB) from a pixel shader. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_SRC_COLOR => 3

    /**
     * The blend factor is (1 - Rₛ, 1 - Gₛ, 1 - Bₛ, 1 - Aₛ), that is color data (RGB) from a pixel shader. The pre-blend operation inverts the data, generating 1 - RGB.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_SRC_COLOR => 4

    /**
     * The blend factor is (Aₛ, Aₛ, Aₛ, Aₛ), that is alpha data (A) from a pixel shader. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_SRC_ALPHA => 5

    /**
     * The blend factor is ( 1 - Aₛ, 1 - Aₛ, 1 - Aₛ, 1 - Aₛ), that is alpha data (A) from a pixel shader. The pre-blend operation inverts the data, generating 1 - A.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_SRC_ALPHA => 6

    /**
     * The blend factor is (A<sub>d</sub> A<sub>d</sub> A<sub>d</sub> A<sub>d</sub>), that is alpha data from a render target. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_DEST_ALPHA => 7

    /**
     * The blend factor is (1 - A<sub>d</sub> 1 - A<sub>d</sub> 1 - A<sub>d</sub> 1 - A<sub>d</sub>), that is alpha data from a render target. The pre-blend operation inverts the data, generating 1 - A.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_DEST_ALPHA => 8

    /**
     * The blend factor is (R<sub>d</sub>, G<sub>d</sub>, B<sub>d</sub>, A<sub>d</sub>), that is color data from a render target. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_DEST_COLOR => 9

    /**
     * The blend factor is (1 - R<sub>d</sub>, 1 - G<sub>d</sub>, 1 - B<sub>d</sub>, 1 - A<sub>d</sub>), that is color data from a render target. The pre-blend operation inverts the data, generating 1 - RGB.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_DEST_COLOR => 10

    /**
     * The blend factor is (f, f, f, 1); where f = min(Aₛ, 1
 *     - A<sub>d</sub>). The pre-blend operation clamps the data to 1 or less.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_SRC_ALPHA_SAT => 11

    /**
     * The blend factor is the blend factor set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate">ID3D11DeviceContext::OMSetBlendState</a>. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_BLEND_FACTOR => 14

    /**
     * The blend factor is the blend factor set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetblendstate">ID3D11DeviceContext::OMSetBlendState</a>. The pre-blend operation inverts the blend factor, generating 1 - blend_factor.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_BLEND_FACTOR => 15

    /**
     * The blend factor is data sources both as color data output by a pixel shader. There is no pre-blend operation. This blend factor supports dual-source color blending.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_SRC1_COLOR => 16

    /**
     * The blend factor is data sources both as color data output by a pixel shader. The pre-blend operation inverts the data, generating 1 - RGB. This blend factor supports dual-source color blending.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_SRC1_COLOR => 17

    /**
     * The blend factor is data sources as alpha data output by a pixel shader. There is no pre-blend operation. This blend factor supports dual-source color blending.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_SRC1_ALPHA => 18

    /**
     * The blend factor is data sources as alpha data output by a pixel shader. The pre-blend operation inverts the data, generating 1 - A. This blend factor supports dual-source color blending.
     * @type {Integer (Int32)}
     */
    static D3D11_BLEND_INV_SRC1_ALPHA => 19
}
