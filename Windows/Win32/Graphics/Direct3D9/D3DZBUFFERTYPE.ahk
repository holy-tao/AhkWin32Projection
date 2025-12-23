#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that describe depth-buffer formats.
 * @remarks
 * Members of this enumerated type are used with the D3DRS\_ZENABLE render state.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dzbuffertype
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DZBUFFERTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DZB_FALSE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DZB_TRUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DZB_USEW => 2
}
