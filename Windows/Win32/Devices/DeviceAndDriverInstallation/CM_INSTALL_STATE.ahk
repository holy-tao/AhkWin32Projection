#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class CM_INSTALL_STATE extends Win32Enum {

    /**
     * Native name: CM_INSTALL_STATE_INSTALLED
     * @type {Integer (UInt32)}
     */
    static INSTALLED => 0

    /**
     * Native name: CM_INSTALL_STATE_NEEDS_REINSTALL
     * @type {Integer (UInt32)}
     */
    static NEEDS_REINSTALL => 1

    /**
     * Native name: CM_INSTALL_STATE_FAILED_INSTALL
     * @type {Integer (UInt32)}
     */
    static FAILED_INSTALL => 2

    /**
     * Native name: CM_INSTALL_STATE_FINISH_INSTALL
     * @type {Integer (UInt32)}
     */
    static FINISH_INSTALL => 3
}
