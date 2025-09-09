#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_FAULT_DOMAIN_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    NumberOfFaultDomains {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Guid>}
     */
    FaultDomainIds{
        get {
            if(!this.HasProp("__FaultDomainIdsProxyArray"))
                this.__FaultDomainIdsProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "ptr")
            return this.__FaultDomainIdsProxyArray
        }
    }
}
