#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the parts of the depth stencil to clear.
 * @remarks
 * These flags are used when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-cleardepthstencilview">ID3D11DeviceContext::ClearDepthStencilView</a>; the flags can be combined with a bitwise OR.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_clear_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CLEAR_FLAG extends Win32BitflagEnum{

    /**
     * Clear the depth buffer, using fast clear if possible, then place the resource in a compressed state.
     * @type {Integer (UInt32)}
     */
    static D3D11_CLEAR_DEPTH => 1

    /**
     * Clear the stencil buffer, using fast clear if possible, then place the resource in a compressed state.
     * @type {Integer (UInt32)}
     */
    static D3D11_CLEAR_STENCIL => 2
}
