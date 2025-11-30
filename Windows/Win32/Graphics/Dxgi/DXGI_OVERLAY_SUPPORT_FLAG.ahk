#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies overlay support to check for in a call to IDXGIOutput3::CheckOverlaySupport.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/ne-dxgi1_3-dxgi_overlay_support_flag
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OVERLAY_SUPPORT_FLAG extends Win32BitflagEnum{

    /**
     * Direct overlay support.
     * @type {Integer (Int32)}
     */
    static DXGI_OVERLAY_SUPPORT_FLAG_DIRECT => 1

    /**
     * Scaling overlay support.
     * @type {Integer (Int32)}
     */
    static DXGI_OVERLAY_SUPPORT_FLAG_SCALING => 2
}
