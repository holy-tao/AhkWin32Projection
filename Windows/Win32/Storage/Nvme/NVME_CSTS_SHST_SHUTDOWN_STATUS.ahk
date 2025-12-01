#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the status of shutdown processing that is initiated by the host setting the **SHN** field in the [NVME_CONTROLLER_CONFIGURATION](../nvme/ns-nvme-nvme_controller_configuration.md) structure.
 * @remarks
 * To start executing commands on the controller after a shutdown operation, (when the **SHST** field of the [NVME_CONTROLLER_STATUS](../nvme/ns-nvme-nvme_controller_status.md) structure is set to `10b`, a Controller Reset (setting the **EN** field in [NVME_CONTROLLER_CONFIGURATION](../nvme/ns-nvme-nvme_controller_configuration.md) to `0`) is required. If the host software submits commands to the controller without issuing a reset, the behavior is undefined.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_csts_shst_shutdown_status
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CSTS_SHST_SHUTDOWN_STATUS extends Win32Enum{

    /**
     * Normal operation (no shutdown has been requested).
     * @type {Integer (Int32)}
     */
    static NVME_CSTS_SHST_NO_SHUTDOWN => 0

    /**
     * Shutdown processing is occurring.
     * @type {Integer (Int32)}
     */
    static NVME_CSTS_SHST_SHUTDOWN_IN_PROCESS => 1

    /**
     * Shutdown processing is complete.
     * @type {Integer (Int32)}
     */
    static NVME_CSTS_SHST_SHUTDOWN_COMPLETED => 2
}
