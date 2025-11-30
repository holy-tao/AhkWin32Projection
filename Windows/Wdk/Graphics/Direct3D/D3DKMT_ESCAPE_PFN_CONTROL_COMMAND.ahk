#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_ESCAPE_PFN_CONTROL_COMMAND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_PFN_CONTROL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_PFN_CONTROL_FORCE_CPU => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_ESCAPE_PFN_CONTROL_FORCE_GPU => 2
}
