#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISC_CONTROL_BLOCK_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    ContentDescriptor{
        get {
            if(!this.HasProp("__ContentDescriptorProxyArray"))
                this.__ContentDescriptorProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__ContentDescriptorProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReservedDoNotUse_UseAsByteInstead_0{
        get {
            if(!this.HasProp("__ReservedDoNotUse_UseAsByteInstead_0ProxyArray"))
                this.__ReservedDoNotUse_UseAsByteInstead_0ProxyArray := Win32FixedArray(this.ptr + 4, 3, Primitive, "char")
            return this.__ReservedDoNotUse_UseAsByteInstead_0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Array<Byte>}
     */
    AsByte{
        get {
            if(!this.HasProp("__AsByteProxyArray"))
                this.__AsByteProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__AsByteProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    VendorId{
        get {
            if(!this.HasProp("__VendorIdProxyArray"))
                this.__VendorIdProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "char")
            return this.__VendorIdProxyArray
        }
    }
}
