#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Blend options. A blend option identifies the data source and an optional pre-blend operation.
 * @remarks
 * 
 * Blend operations are specified in a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_blend_desc">blend description</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_blend
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_BLEND extends Win32Enum{

    /**
     * The data source is the color black (0, 0, 0, 0). No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_ZERO => 1

    /**
     * The data source is the color white (1, 1, 1, 1). No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_ONE => 2

    /**
     * The data source is color data (RGB) from a pixel shader. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_SRC_COLOR => 3

    /**
     * The data source is color data (RGB) from a pixel shader. The pre-blend operation inverts the data, generating 1 - RGB.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_SRC_COLOR => 4

    /**
     * The data source is alpha data (A) from a pixel shader. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_SRC_ALPHA => 5

    /**
     * The data source is alpha data (A) from a pixel shader. The pre-blend operation inverts the data, generating 1 - A.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_SRC_ALPHA => 6

    /**
     * The data source is alpha data from a rendertarget. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_DEST_ALPHA => 7

    /**
     * The data source is alpha data from a rendertarget. The pre-blend operation inverts the data, generating 1 - A.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_DEST_ALPHA => 8

    /**
     * The data source is color data from a rendertarget. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_DEST_COLOR => 9

    /**
     * The data source is color data from a rendertarget. The pre-blend operation inverts the data, generating 1 - RGB.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_DEST_COLOR => 10

    /**
     * The data source is alpha data from a pixel shader. The pre-blend operation clamps the data to 1 or less.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_SRC_ALPHA_SAT => 11

    /**
     * The data source is the blend factor set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetblendstate">ID3D10Device::OMSetBlendState</a>. No pre-blend operation.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_BLEND_FACTOR => 14

    /**
     * The data source is the blend factor set with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-omsetblendstate">ID3D10Device::OMSetBlendState</a>. The pre-blend operation inverts the blend factor, generating 1 - blend_factor.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_BLEND_FACTOR => 15

    /**
     * The data sources are both color data output by a pixel shader. There is no pre-blend operation. This options supports <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">dual-source color blending</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_SRC1_COLOR => 16

    /**
     * The data sources are both color data output by a pixel shader. The pre-blend operation inverts the data, generating 1 - RGB. This options supports <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">dual-source color blending</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_SRC1_COLOR => 17

    /**
     * The data sources are alpha data output by a pixel shader. There is no pre-blend operation. This options supports <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">dual-source color blending</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_SRC1_ALPHA => 18

    /**
     * The data sources are alpha data output by a pixel shader. The pre-blend operation inverts the data, generating 1 - A. This options supports <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d10-graphics-programming-guide-blend-state">dual-source color blending</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_BLEND_INV_SRC1_ALPHA => 19
}
