#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_HDCP_FLAG extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_HDCP_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DXGKMDT_OPM_HDCP_FLAG_REPEATER
     * @type {Integer (Int32)}
     */
    static REPEATER => 1
}
