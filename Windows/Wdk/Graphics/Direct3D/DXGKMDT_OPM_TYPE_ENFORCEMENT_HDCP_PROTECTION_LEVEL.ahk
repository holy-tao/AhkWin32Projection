#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_PROTECTION_LEVEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_NO_TYPE_RESTRICTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_TYPE1_RESTRICTION => 2
}
