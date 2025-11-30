#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_HDCP_FLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_HDCP_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_HDCP_FLAG_REPEATER => 1
}
