#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * TBD
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tri_state
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TRI_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies TBD.
     * @type {Integer (Int32)}
     */
    static D3D12_TRI_STATE_UNKNOWN => -1

    /**
     * Specifies TBD.
     * @type {Integer (Int32)}
     */
    static D3D12_TRI_STATE_FALSE => 0

    /**
     * Specifies TBD.
     * @type {Integer (Int32)}
     */
    static D3D12_TRI_STATE_TRUE => 1
}
