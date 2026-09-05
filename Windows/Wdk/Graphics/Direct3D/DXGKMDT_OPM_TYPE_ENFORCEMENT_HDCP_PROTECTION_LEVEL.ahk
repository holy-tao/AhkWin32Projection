#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_PROTECTION_LEVEL extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_NO_TYPE_RESTRICTION
     * @type {Integer (Int32)}
     */
    static ON_WITH_NO_TYPE_RESTRICTION => 1

    /**
     * Native name: DXGKMDT_OPM_TYPE_ENFORCEMENT_HDCP_ON_WITH_TYPE1_RESTRICTION
     * @type {Integer (Int32)}
     */
    static ON_WITH_TYPE1_RESTRICTION => 2
}
