#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that describe the fog mode.
 * @remarks
 * The values in this enumerated type are used by the D3DRS\_FOGTABLEMODE and D3DRS\_FOGVERTEXMODE render states.
  * 
  * Fog can be considered a measure of visibility: the lower the fog value produced by a fog equation, the less visible an object is.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dfogmode
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DFOGMODE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DFOG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DFOG_EXP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFOG_EXP2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFOG_LINEAR => 3
}
