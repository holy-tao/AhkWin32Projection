#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_ACP_PROTECTION_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_LEVEL_ONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_LEVEL_TWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_ACP_LEVEL_THREE => 3
}
