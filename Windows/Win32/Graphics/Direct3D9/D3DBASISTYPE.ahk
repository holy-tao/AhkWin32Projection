#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the basis type of a high-order patch surface.
 * @remarks
 * The members of **D3DBASISTYPE** specify the formulation to be used in evaluating the high-order patch surface primitive during tessellation.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dbasistype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DBASISTYPE {
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
    static D3DBASIS_BEZIER => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DBASIS_BSPLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DBASIS_CATMULL_ROM => 2
}
