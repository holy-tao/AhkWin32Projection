#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_INSTALL_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_INSTALLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_NEEDS_REINSTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_FAILED_INSTALL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_INSTALL_STATE_FINISH_INSTALL => 3
}
