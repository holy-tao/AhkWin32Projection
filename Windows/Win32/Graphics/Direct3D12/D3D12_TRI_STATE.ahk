#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * TBD
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tri_state
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TRI_STATE extends Win32Enum{

    /**
     * Specifies TBD.
     * @type {Integer (Int32)}
     */
    static D3D12_TRI_STATE_UNKNOWN => -1

    /**
     * Specifies TBD.
     * @type {Integer (Int32)}
     */
    static D3D12_TRI_STATE_FALSE => 0

    /**
     * Specifies TBD.
     * @type {Integer (Int32)}
     */
    static D3D12_TRI_STATE_TRUE => 1
}
