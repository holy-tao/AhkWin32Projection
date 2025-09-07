#Requires AutoHotkey v2.0.0 64-bit

/**
 * Option(s) for raising an error to a non-continuable exception. (D3D11_RAISE_FLAG)
 * @remarks
 * These flags are used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-getexceptionmode">ID3D11Device::GetExceptionMode</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-setexceptionmode">ID3D11Device::SetExceptionMode</a>. Use 0 to indicate no flags; multiple flags can be logically OR'ed together.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_raise_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RAISE_FLAG{

    /**
     * Raise an internal driver error to a non-continuable exception.
     * @type {Integer (Int32)}
     */
    static D3D11_RAISE_FLAG_DRIVER_INTERNAL_ERROR => 1
}
