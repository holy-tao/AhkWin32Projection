#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_PROTECTION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_OTHER => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_COPP_COMPATIBLE_HDCP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_ACP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_CGMSA => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_HDCP => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_DPCP => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_TYPE_ENFORCEMENT_HDCP => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_TYPE_MASK => -2147483585
}
