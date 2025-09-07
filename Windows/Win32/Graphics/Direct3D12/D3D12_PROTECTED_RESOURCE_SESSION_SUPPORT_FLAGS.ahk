#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify protected resource session support.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_resource_session_support_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS{

    /**
     * Indicates that protected resource sessions are not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_NONE => 0

    /**
     * Indicates that protected resource sessions are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_SUPPORTED => 1
}
