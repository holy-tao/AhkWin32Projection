#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the light type.
 * @remarks
 * Directional lights are slightly faster than point light sources, but point lights look a little better. Spotlights offer interesting visual effects but are computationally time-consuming.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dlighttype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DLIGHTTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
