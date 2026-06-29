#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies flags to be used when creating a command queue.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_command_queue_desc">D3D12_COMMAND_QUEUE_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_queue_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMMAND_QUEUE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a default command queue.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_FLAG_NONE => 0

    /**
     * Indicates that the GPU timeout should be disabled for this command queue.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_FLAG_DISABLE_GPU_TIMEOUT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_QUEUE_FLAG_ALLOW_DYNAMIC_PRIORITY => 2
}
