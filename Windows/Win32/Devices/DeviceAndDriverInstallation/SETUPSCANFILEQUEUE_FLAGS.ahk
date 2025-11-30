#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUPSCANFILEQUEUE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_PRESENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_VALIDITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_CALLBACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_CALLBACKEX => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_INFORM_USER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_PRUNE_COPY_QUEUE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_CALLBACK_SIGNERINFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_PRUNE_DELREN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_PRESENCE_WITHOUT_SOURCE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_FILE_COMPARISON => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_ACTIVATE_DRP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SPQ_SCAN_USE_OEM_CATALOGS => 2048
}
