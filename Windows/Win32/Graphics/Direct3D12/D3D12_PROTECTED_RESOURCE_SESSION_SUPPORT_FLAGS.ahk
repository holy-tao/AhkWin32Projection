#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify protected resource session support.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_resource_session_support_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS extends Win32BitflagEnum {

    /**
     * Indicates that protected resource sessions are not supported.
     * Native name: D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Indicates that protected resource sessions are supported.
     * Native name: D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAG_SUPPORTED
     * @type {Integer (Int32)}
     */
    static FLAG_SUPPORTED => 1
}
