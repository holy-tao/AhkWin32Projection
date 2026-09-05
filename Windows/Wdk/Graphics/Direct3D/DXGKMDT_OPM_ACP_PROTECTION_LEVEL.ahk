#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_ACP_PROTECTION_LEVEL extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_ACP_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: DXGKMDT_OPM_ACP_LEVEL_ONE
     * @type {Integer (Int32)}
     */
    static ONE => 1

    /**
     * Native name: DXGKMDT_OPM_ACP_LEVEL_TWO
     * @type {Integer (Int32)}
     */
    static TWO => 2

    /**
     * Native name: DXGKMDT_OPM_ACP_LEVEL_THREE
     * @type {Integer (Int32)}
     */
    static THREE => 3
}
