#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_DISK_HEALTH_STATUS.ahk
#Include .\STORAGE_DISK_OPERATIONAL_STATUS.ahk
#Include .\STORAGE_OPERATIONAL_STATUS_REASON.ahk
#Include .\STORAGE_OPERATIONAL_REASON.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DEVICE_MANAGEMENT_STATUS extends Win32Struct {
    static sizeof => 100

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {STORAGE_DISK_HEALTH_STATUS}
     */
    Health {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberOfOperationalStatus {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    NumberOfAdditionalReasons {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<STORAGE_DISK_OPERATIONAL_STATUS>}
     */
    OperationalStatus {
        get {
            if(!this.HasProp("__OperationalStatusProxyArray"))
                this.__OperationalStatusProxyArray := Win32FixedArray(this.ptr + 20, 16, Primitive, "int")
            return this.__OperationalStatusProxyArray
        }
    }

    /**
     * @type {STORAGE_OPERATIONAL_REASON}
     */
    AdditionalReasons {
        get {
            if(!this.HasProp("__AdditionalReasonsProxyArray"))
                this.__AdditionalReasonsProxyArray := Win32FixedArray(this.ptr + 84, 1, STORAGE_OPERATIONAL_REASON, "")
            return this.__AdditionalReasonsProxyArray
        }
    }
}
