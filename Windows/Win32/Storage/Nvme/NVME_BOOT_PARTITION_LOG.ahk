#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_BOOT_PARTITION_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
class NVME_BOOT_PARTITION_LOG extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    LogIdentifier {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved0 {
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {NVME_BOOT_PARTITION_INFORMATION}
     */
    BpInfo {
        get {
            if(!this.HasProp("__BpInfo"))
                this.__BpInfo := NVME_BOOT_PARTITION_INFORMATION(4, this)
            return this.__BpInfo
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 12, 8, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    BootPartitionData {
        get {
            if(!this.HasProp("__BootPartitionDataProxyArray"))
                this.__BootPartitionDataProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__BootPartitionDataProxyArray
        }
    }
}
