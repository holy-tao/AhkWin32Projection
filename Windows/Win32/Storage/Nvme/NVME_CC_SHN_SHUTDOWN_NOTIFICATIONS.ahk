#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate a Controller Configuration (CC) shutdown notification.
 * @remarks
 * Use the CC shutdown notification values from this enumeration in the **SHN** field (offset 14h) of the [NVME_CONTROLLER_CONFIGURATION](ns-nvme-nvme_controller_configuration.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_cc_shn_shutdown_notifications
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_CC_SHN_SHUTDOWN_NOTIFICATIONS extends Win32Enum {

    /**
     * No notification and no effect.
     * Native name: NVME_CC_SHN_NO_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static NO_NOTIFICATION => 0

    /**
     * Normal shutdown notification.
     * Native name: NVME_CC_SHN_NORMAL_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static NORMAL_SHUTDOWN => 1

    /**
     * Abrupt shutdown notification.
     * Native name: NVME_CC_SHN_ABRUPT_SHUTDOWN
     * @type {Integer (Int32)}
     */
    static ABRUPT_SHUTDOWN => 2
}
