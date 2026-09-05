#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_PROTECTION_TYPE extends Win32Enum {

    /**
     * Native name: OPM_PROTECTION_TYPE_OTHER
     * @type {Integer (Int32)}
     */
    static OTHER => -2147483648

    /**
     * Native name: OPM_PROTECTION_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: OPM_PROTECTION_TYPE_COPP_COMPATIBLE_HDCP
     * @type {Integer (Int32)}
     */
    static COPP_COMPATIBLE_HDCP => 1

    /**
     * Native name: OPM_PROTECTION_TYPE_ACP
     * @type {Integer (Int32)}
     */
    static ACP => 2

    /**
     * Native name: OPM_PROTECTION_TYPE_CGMSA
     * @type {Integer (Int32)}
     */
    static CGMSA => 4

    /**
     * Native name: OPM_PROTECTION_TYPE_HDCP
     * @type {Integer (Int32)}
     */
    static HDCP => 8

    /**
     * Native name: OPM_PROTECTION_TYPE_DPCP
     * @type {Integer (Int32)}
     */
    static DPCP => 16

    /**
     * Native name: OPM_PROTECTION_TYPE_TYPE_ENFORCEMENT_HDCP
     * @type {Integer (Int32)}
     */
    static TYPE_ENFORCEMENT_HDCP => 32
}
