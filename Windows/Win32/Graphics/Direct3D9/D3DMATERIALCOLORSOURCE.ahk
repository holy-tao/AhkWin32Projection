#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dmaterialcolorsource
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DMATERIALCOLORSOURCE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DMCS_MATERIAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DMCS_COLOR1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DMCS_COLOR2 => 2
}
