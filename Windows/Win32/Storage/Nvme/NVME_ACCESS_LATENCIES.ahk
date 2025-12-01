#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the latency of a read and write operation.
 * @remarks
 * This enumeration is used to specify values in the **AccessLatency** field of the [NVME_CDW13_READ_WRITE](ns-nvme-nvme_cdw13_read_write.md) structure and in the **AccessLatency** field of the [NVME_CONTEXT_ATTRIBUTES](ns-nvme-nvme_context_attributes.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_access_latencies
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ACCESS_LATENCIES extends Win32Enum{

    /**
     * None. No latency information provided.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_NONE => 0

    /**
     * Idle. Longer latency acceptable.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_IDLE => 1

    /**
     * Normal. Typical latency.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_NORMAL => 2

    /**
     * Low. Smallest possible latency.
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_LOW => 3
}
