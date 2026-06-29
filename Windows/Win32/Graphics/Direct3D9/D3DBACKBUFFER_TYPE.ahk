#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that describe the type of back buffer.
 * @remarks
 * Direct3D 9 does not support stereo view, so Direct3D does not use the D3DBACKBUFFER\_TYPE\_LEFT and D3DBACKBUFFER\_TYPE\_RIGHT values of this enumerated type.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dbackbuffer-type
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DBACKBUFFER_TYPE {
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
    static D3DBACKBUFFER_TYPE_MONO => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DBACKBUFFER_TYPE_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DBACKBUFFER_TYPE_RIGHT => 2
}
