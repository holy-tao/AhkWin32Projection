#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_PROTECTION_TYPE extends Win32Enum {

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => -2147483648

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_COPP_COMPATIBLE_HDCP
     * @type {Integer (Int32)}
     */
    static COPP_COMPATIBLE_HDCP => 1

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_ACP
     * @type {Integer (Int32)}
     */
    static ACP => 2

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_CGMSA
     * @type {Integer (Int32)}
     */
    static CGMSA => 4

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_HDCP
     * @type {Integer (Int32)}
     */
    static HDCP => 8

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_DPCP
     * @type {Integer (Int32)}
     */
    static DPCP => 16

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_TYPE_ENFORCEMENT_HDCP
     * @type {Integer (Int32)}
     */
    static TYPE_ENFORCEMENT_HDCP => 32

    /**
     * Native name: DXGKMDT_OPM_PROTECTION_TYPE_MASK
     * @type {Integer (Int32)}
     */
    static MASK => -2147483585
}
