#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a command list.
 * @remarks
 * This enum is used by the following methods:
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandallocator">CreateCommandAllocator</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandqueue">CreateCommandQueue</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandlist">CreateCommandList</a>
  * </li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_LIST_TYPE{

    /**
     * Specifies a command buffer that the GPU can execute. A direct command list doesn't inherit any GPU state.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_DIRECT => 0

    /**
     * Specifies a command buffer that can be executed only directly via a direct command list. A bundle command list inherits all GPU state (except for the currently set pipeline state object and primitive topology).
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_BUNDLE => 1

    /**
     * Specifies a command buffer for computing.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_COMPUTE => 2

    /**
     * Specifies a command buffer for copying.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_COPY => 3

    /**
     * Specifies a command buffer for video decoding.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_VIDEO_DECODE => 4

    /**
     * Specifies a command buffer for video processing.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_VIDEO_ENCODE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_TYPE_NONE => -1
}
