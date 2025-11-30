#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies what to clear from the depth stencil view.
 * @remarks
 * 
 * This enum is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-cleardepthstencilview">ID3D12GraphicsCommandList::ClearDepthStencilView</a>.
 *           The flags can be combined to clear all.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_clear_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_CLEAR_FLAGS extends Win32BitflagEnum{

    /**
     * Indicates the depth buffer should be cleared.
     * @type {Integer (Int32)}
     */
    static D3D12_CLEAR_FLAG_DEPTH => 1

    /**
     * Indicates the stencil buffer should be cleared.
     * @type {Integer (Int32)}
     */
    static D3D12_CLEAR_FLAG_STENCIL => 2
}
