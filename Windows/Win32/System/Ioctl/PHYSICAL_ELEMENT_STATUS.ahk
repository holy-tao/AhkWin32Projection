#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_ELEMENT_STATUS_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class PHYSICAL_ELEMENT_STATUS extends Win32Struct
{
    static sizeof => 32

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
    DescriptorCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ReturnedDescriptorCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ElementIdentifierBeingDepoped {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<PHYSICAL_ELEMENT_STATUS_DESCRIPTOR>}
     */
    Descriptors{
        get {
            if(!this.HasProp("__DescriptorsProxyArray"))
                this.__DescriptorsProxyArray := Win32FixedArray(this.ptr + 24, 1, PHYSICAL_ELEMENT_STATUS_DESCRIPTOR, "")
            return this.__DescriptorsProxyArray
        }
    }
}
