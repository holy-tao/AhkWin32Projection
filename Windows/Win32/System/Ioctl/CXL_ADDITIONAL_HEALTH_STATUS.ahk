#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_ADDITIONAL_HEALTH_STATUS extends Win32Enum {

    /**
     * Native name: CxlAdditionalHealthStatus_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: CxlAdditionalHealthStatus_Warning
     * @type {Integer (Int32)}
     */
    static Warning => 1

    /**
     * Native name: CxlAdditionalHealthStatus_Critical
     * @type {Integer (Int32)}
     */
    static Critical => 2
}
