#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ne-nvme-nvme_access_latencies
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ACCESS_LATENCIES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_IDLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static NVME_ACCESS_LATENCY_LOW => 3
}
