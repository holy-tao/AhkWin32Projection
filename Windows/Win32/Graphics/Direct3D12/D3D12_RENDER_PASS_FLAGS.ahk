#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the nature of the render pass; for example, whether it is a suspending or a resuming render pass.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RENDER_PASS_FLAGS extends Win32BitflagEnum {

    /**
     * Indicates that the render pass has no special requirements.
     * Native name: D3D12_RENDER_PASS_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Indicates that writes to unordered access view(s) should be allowed during the render pass.
     * Native name: D3D12_RENDER_PASS_FLAG_ALLOW_UAV_WRITES
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_UAV_WRITES => 1

    /**
     * Indicates that this is a suspending render pass.
     * Native name: D3D12_RENDER_PASS_FLAG_SUSPENDING_PASS
     * @type {Integer (Int32)}
     */
    static FLAG_SUSPENDING_PASS => 2

    /**
     * Indicates that this is a resuming render pass.
     * Native name: D3D12_RENDER_PASS_FLAG_RESUMING_PASS
     * @type {Integer (Int32)}
     */
    static FLAG_RESUMING_PASS => 4

    /**
     * Native name: D3D12_RENDER_PASS_FLAG_BIND_READ_ONLY_DEPTH
     * @type {Integer (Int32)}
     */
    static FLAG_BIND_READ_ONLY_DEPTH => 8

    /**
     * Native name: D3D12_RENDER_PASS_FLAG_BIND_READ_ONLY_STENCIL
     * @type {Integer (Int32)}
     */
    static FLAG_BIND_READ_ONLY_STENCIL => 16
}
