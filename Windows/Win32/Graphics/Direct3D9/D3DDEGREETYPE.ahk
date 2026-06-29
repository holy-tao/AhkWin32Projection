#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the degree of the variables in the equation that describes a curve.
 * @remarks
 * The values in this enumeration are used to describe the curves used by rectangle and triangle patches. For more information, see D3DRS\_CULLMODE.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddegreetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDEGREETYPE {
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
    static D3DDEGREE_LINEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_QUADRATIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_CUBIC => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEGREE_QUINTIC => 5
}
