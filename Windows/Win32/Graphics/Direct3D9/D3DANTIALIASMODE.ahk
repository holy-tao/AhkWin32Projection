#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DANTIALIASMODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DANTIALIAS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DANTIALIAS_SORTDEPENDENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DANTIALIAS_SORTINDEPENDENT => 2
}
