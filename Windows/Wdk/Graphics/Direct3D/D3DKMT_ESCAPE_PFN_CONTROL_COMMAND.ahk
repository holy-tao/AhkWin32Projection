#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ESCAPE_PFN_CONTROL_COMMAND extends Win32Enum {

    /**
     * Native name: D3DKMT_ESCAPE_PFN_CONTROL_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: D3DKMT_ESCAPE_PFN_CONTROL_FORCE_CPU
     * @type {Integer (Int32)}
     */
    static FORCE_CPU => 1

    /**
     * Native name: D3DKMT_ESCAPE_PFN_CONTROL_FORCE_GPU
     * @type {Integer (Int32)}
     */
    static FORCE_GPU => 2
}
