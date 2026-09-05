#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_DPCP_PROTECTION_LEVEL extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_DPCP_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: DXGKMDT_OPM_DPCP_ON
     * @type {Integer (Int32)}
     */
    static ON => 1
}
