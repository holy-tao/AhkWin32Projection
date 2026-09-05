#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * TBD
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tri_state
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_TRI_STATE extends Win32Enum {

    /**
     * Specifies TBD.
     * Native name: D3D12_TRI_STATE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1

    /**
     * Specifies TBD.
     * Native name: D3D12_TRI_STATE_FALSE
     * @type {Integer (Int32)}
     */
    static FALSE => 0

    /**
     * Specifies TBD.
     * Native name: D3D12_TRI_STATE_TRUE
     * @type {Integer (Int32)}
     */
    static TRUE => 1
}
