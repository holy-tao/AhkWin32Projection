#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_CODES extends Win32Enum {

    /**
     * Native name: NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_RESERVED
     * @type {Integer (Int32)}
     */
    static RESERVED => 0

    /**
     * Native name: NVME_ASYNC_EVENT_TYPE_VENDOR_SPECIFIC_DEVICE_PANIC
     * @type {Integer (Int32)}
     */
    static DEVICE_PANIC => 1
}
