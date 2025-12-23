#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the debug monitor tokens.
 * @remarks
 * The values in this enumerated type are used by the D3DRS\_DEBUGMONITORTOKEN render state and are only relevant for debug builds.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddebugmonitortokens
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDEBUGMONITORTOKENS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDMT_ENABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDMT_DISABLE => 1
}
