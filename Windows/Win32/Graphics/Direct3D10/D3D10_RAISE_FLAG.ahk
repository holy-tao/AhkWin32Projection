#Requires AutoHotkey v2.0.0 64-bit

/**
 * Option(s) for raising an error to a non-continuable exception.
 * @remarks
 * 
 * These flags are used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-getexceptionmode">ID3D10Device::GetExceptionMode</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-setexceptionmode">ID3D10Device::SetExceptionMode</a>. Use 0 to indicate no flags; multiple flags can be logically OR'ed together.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_raise_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_RAISE_FLAG{

    /**
     * Raise an internal driver error to a non-continuable exception.
     * @type {Integer (Int32)}
     */
    static D3D10_RAISE_FLAG_DRIVER_INTERNAL_ERROR => 1
}
