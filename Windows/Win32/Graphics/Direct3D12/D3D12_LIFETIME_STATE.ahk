#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify the lifetime state of a lifetime-tracked object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_lifetime_state
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_LIFETIME_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that the lifetime-tracked object is in use.
     * @type {Integer (Int32)}
     */
    static D3D12_LIFETIME_STATE_IN_USE => 0

    /**
     * Specifies that the lifetime-tracked object is not in use.
     * @type {Integer (Int32)}
     */
    static D3D12_LIFETIME_STATE_NOT_IN_USE => 1
}
