#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the location at which a color or color component must be accessed for lighting calculations.
 * @remarks
 * These flags are used to set the value of the following render states in the [**D3DRENDERSTATETYPE**](./d3drenderstatetype.md) enumerated type.
 * 
 * -   D3DRS\_AMBIENTMATERIALSOURCE
 * -   D3DRS\_DIFFUSEMATERIALSOURCE
 * -   D3DRS\_EMISSIVEMATERIALSOURCE
 * -   D3DRS\_SPECULARMATERIALSOURCE
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dmaterialcolorsource
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DMATERIALCOLORSOURCE {
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
    static D3DMCS_MATERIAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DMCS_COLOR1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DMCS_COLOR2 => 2
}
