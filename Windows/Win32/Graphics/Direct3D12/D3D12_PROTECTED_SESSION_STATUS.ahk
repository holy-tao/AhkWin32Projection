#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify protected session status.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_protected_session_status
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PROTECTED_SESSION_STATUS extends Win32Enum{

    /**
     * Indicates that the protected session is in a valid state.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_SESSION_STATUS_OK => 0

    /**
     * Indicates that the protected session is not in a valid state.
     * @type {Integer (Int32)}
     */
    static D3D12_PROTECTED_SESSION_STATUS_INVALID => 1
}
