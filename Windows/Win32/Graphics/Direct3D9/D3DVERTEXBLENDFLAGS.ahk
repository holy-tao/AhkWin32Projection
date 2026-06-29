#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags used to control the number or matrices that the system applies when performing multimatrix vertex blending.
 * @remarks
 * Members of this type are used with the D3DRS\_VERTEXBLEND render state.
 * 
 * Geometry blending (multimatrix vertex blending) requires that your application use a vertex format that has blending (beta) weights for each vertex.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dvertexblendflags
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVERTEXBLENDFLAGS {
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
    static D3DVBF_DISABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBF_1WEIGHTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBF_2WEIGHTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBF_3WEIGHTS => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBF_TWEENING => 255

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBF_0WEIGHTS => 256
}
