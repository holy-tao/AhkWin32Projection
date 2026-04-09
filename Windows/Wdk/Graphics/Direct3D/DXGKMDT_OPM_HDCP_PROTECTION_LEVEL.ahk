#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_HDCP_PROTECTION_LEVEL extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_HDCP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_HDCP_ON => 1
}
