#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines whether the current tessellation mode is discrete or continuous.
 * @remarks
 * Note that continuous tessellation produces a completely different tessellation pattern from the discrete one for the same tessellation values (this is more apparent in wireframe mode). Thus, 4.0 continuous is not the same as 4 discrete.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dpatchedgestyle
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DPATCHEDGESTYLE{

    /**
     * @type {Integer (Int32)}
     */
    static D3DPATCHEDGE_DISCRETE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DPATCHEDGE_CONTINUOUS => 1
}
