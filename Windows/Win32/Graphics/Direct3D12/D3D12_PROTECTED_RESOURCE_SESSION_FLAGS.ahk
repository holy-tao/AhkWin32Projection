#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify protected resource session flags.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_resource_session_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PROTECTED_RESOURCE_SESSION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies no flag.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_RESOURCE_SESSION_FLAG_NONE => 0
}
