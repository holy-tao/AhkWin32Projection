#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the light type.
 * @remarks
 * Directional lights are slightly faster than point light sources, but point lights look a little better. Spotlights offer interesting visual effects but are computationally time-consuming.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlighttype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DLIGHTTYPE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHT_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHT_SPOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHT_DIRECTIONAL => 3
}
