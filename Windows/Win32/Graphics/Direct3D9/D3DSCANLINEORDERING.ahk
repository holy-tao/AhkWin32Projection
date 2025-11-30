#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dscanlineordering
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSCANLINEORDERING extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_INTERLACED => 2
}
