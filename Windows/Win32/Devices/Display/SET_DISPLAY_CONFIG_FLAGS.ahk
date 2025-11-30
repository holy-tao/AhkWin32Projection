#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class SET_DISPLAY_CONFIG_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_USE_DATABASE_CURRENT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_TOPOLOGY_INTERNAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_TOPOLOGY_CLONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_TOPOLOGY_EXTEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_TOPOLOGY_EXTERNAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_TOPOLOGY_SUPPLIED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_USE_SUPPLIED_DISPLAY_CONFIG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_VALIDATE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_APPLY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_NO_OPTIMIZATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_SAVE_TO_DATABASE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_ALLOW_CHANGES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_PATH_PERSIST_IF_REQUIRED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_FORCE_MODE_ENUMERATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_ALLOW_PATH_ORDER_CHANGES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_VIRTUAL_MODE_AWARE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SDC_VIRTUAL_REFRESH_RATE_AWARE => 131072
}
