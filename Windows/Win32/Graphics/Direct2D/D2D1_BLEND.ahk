#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how one of the color sources is to be derived and optionally specifies a preblend operation on the color source.
 * @remarks
 * This enumeration has the same numeric values as <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend">D3D10_BLEND</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_blend
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BLEND{

    /**
     * The data source is black (0, 0, 0, 0). There is no preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_ZERO => 1

    /**
     * The data source is white (1, 1, 1, 1). There is no preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_ONE => 2

    /**
     * The data source is color data (RGB) from the second input of the blend transform. There is not a preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_SRC_COLOR => 3

    /**
     * The data source is color data (RGB) from second input of the blend transform. The preblend operation inverts the data, generating 1 - RGB.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_INV_SRC_COLOR => 4

    /**
     * The data source is alpha data (A) from second input of the blend transform. There is no preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_SRC_ALPHA => 5

    /**
     * The data source is alpha data (A) from the second input of the blend transform. The preblend operation inverts the data, generating 1 - A.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_INV_SRC_ALPHA => 6

    /**
     * The data source is alpha data (A) from the first input of the blend transform. There is no preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_DEST_ALPHA => 7

    /**
     * The data source is alpha data (A) from the first input of the blend transform. The preblend operation inverts the data, generating 1 - A.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_INV_DEST_ALPHA => 8

    /**
     * The data source is color data from the first input of the blend transform. There is no preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_DEST_COLOR => 9

    /**
     * The data source is color data from the first input of the blend transform. The preblend operation inverts the data, generating 1 - RGB.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_INV_DEST_COLOR => 10

    /**
     * The data source is alpha data from the second input of the blend transform. The preblend operation clamps the data to 1 or less.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_SRC_ALPHA_SAT => 11

    /**
     * The data source is the blend factor. There is no preblend operation.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_BLEND_FACTOR => 14

    /**
     * The data source is the blend factor. The preblend operation inverts the blend factor, generating 1 - blend_factor.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_INV_BLEND_FACTOR => 15
}
