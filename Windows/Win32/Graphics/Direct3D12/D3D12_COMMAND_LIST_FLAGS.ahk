#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The D3D12_COMMAND_LIST_FLAGS enumeration specifies flags to be used when creating a command list.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMMAND_LIST_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flags specified.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_FLAG_NONE => 0
}
