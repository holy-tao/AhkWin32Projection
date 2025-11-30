#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the lifetime state of a lifetime-tracked object.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_lifetime_state
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_LIFETIME_STATE extends Win32Enum{

    /**
     * Specifies that the lifetime-tracked object is in use.
     * @type {Integer (Int32)}
     */
    static D3D12_LIFETIME_STATE_IN_USE => 0

    /**
     * Specifies that the lifetime-tracked object is not in use.
     * @type {Integer (Int32)}
     */
    static D3D12_LIFETIME_STATE_NOT_IN_USE => 1
}
