#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the nature of the render pass; for example, whether it is a suspending or a resuming render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RENDER_PASS_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates that the render pass has no special requirements.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_FLAG_NONE => 0

    /**
     * Indicates that writes to unordered access view(s) should be allowed during the render pass.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_FLAG_ALLOW_UAV_WRITES => 1

    /**
     * Indicates that this is a suspending render pass.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_FLAG_SUSPENDING_PASS => 2

    /**
     * Indicates that this is a resuming render pass.
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_FLAG_RESUMING_PASS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_FLAG_BIND_READ_ONLY_DEPTH => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_RENDER_PASS_FLAG_BIND_READ_ONLY_STENCIL => 16
}
