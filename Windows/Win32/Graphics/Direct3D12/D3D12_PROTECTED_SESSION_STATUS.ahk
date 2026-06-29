#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify protected session status.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_session_status
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PROTECTED_SESSION_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the protected session is in a valid state.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_SESSION_STATUS_OK => 0

    /**
     * Indicates that the protected session is not in a valid state.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_SESSION_STATUS_INVALID => 1
}
