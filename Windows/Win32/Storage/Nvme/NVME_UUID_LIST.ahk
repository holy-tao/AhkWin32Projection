#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_UUID_LIST_ENTRY.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_UUID_LIST extends Win32Struct {
    static sizeof => 4096

    static packingSize => 1

    /**
     * @type {NVME_UUID_LIST_ENTRY}
     */
    UUID {
        get {
            if(!this.HasProp("__UUIDProxyArray"))
                this.__UUIDProxyArray := Win32FixedArray(this.ptr + 0, 128, NVME_UUID_LIST_ENTRY, "")
            return this.__UUIDProxyArray
        }
    }
}
