#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used to determine which kinds of command lists are capable of supporting various operations.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_command_list_support_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_LIST_SUPPORT_FLAGS{

    /**
     * Specifies that no command list supports the operation in question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_NONE => 0

    /**
     * Specifies that direct command lists can support the operation in question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_DIRECT => 1

    /**
     * Specifies that command list bundles can support the operation in question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_BUNDLE => 2

    /**
     * Specifies that compute command lists can support the operation in question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_COMPUTE => 4

    /**
     * Specifies that copy command lists can support the operation in question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_COPY => 8

    /**
     * Specifies that video-decode command lists can support the operation in question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_DECODE => 16

    /**
     * Specifies that video-processing command lists can support the operation is question.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_PROCESS => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_ENCODE => 64
}
