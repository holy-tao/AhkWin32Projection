#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the supported culling modes.
 * @remarks
 * The values in this enumerated type are used by the D3DRS\_CULLMODE render state. The culling modes define how back faces are culled when rendering a geometry.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcull
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCULL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DCULL_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCULL_CW => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCULL_CCW => 3
}
