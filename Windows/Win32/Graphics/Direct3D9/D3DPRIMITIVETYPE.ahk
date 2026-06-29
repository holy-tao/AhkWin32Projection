#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the primitives supported by Direct3D.
 * @remarks
 * Using [Triangle Strips](triangle-strips.md) or [Triangle Fans (Direct3D 9)](triangle-fans.md) is often more efficient than using triangle lists because fewer vertices are duplicated.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dprimitivetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DPRIMITIVETYPE {
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
    static D3DPT_POINTLIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPT_LINELIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPT_LINESTRIP => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DPT_TRIANGLELIST => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPT_TRIANGLESTRIP => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DPT_TRIANGLEFAN => 6
}
