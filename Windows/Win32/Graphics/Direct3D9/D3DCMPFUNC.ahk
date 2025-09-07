#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the supported compare functions.
 * @remarks
 * The values in this enumerated type define the supported compare functions for the D3DRS\_ZFUNC, D3DRS\_ALPHAFUNC, and D3DRS\_STENCILFUNC render states.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcmpfunc
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCMPFUNC{

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_NEVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_LESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_EQUAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_LESSEQUAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_GREATER => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_NOTEQUAL => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_GREATEREQUAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DCMP_ALWAYS => 8
}
