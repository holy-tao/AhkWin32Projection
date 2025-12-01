#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents product data for a changer device. It is used by the IOCTL_CHANGER_GET_PRODUCT_DATA control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_product_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CHANGER_PRODUCT_DATA extends Win32Struct
{
    static sizeof => 61

    static packingSize => 1

    /**
     * The device manufacturer's name. This is acquired directly from the device inquiry data.
     * @type {Array<Byte>}
     */
    VendorId{
        get {
            if(!this.HasProp("__VendorIdProxyArray"))
                this.__VendorIdProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__VendorIdProxyArray
        }
    }

    /**
     * The product identification, as defined by the vendor. This is acquired directly from the device inquiry data.
     * @type {Array<Byte>}
     */
    ProductId{
        get {
            if(!this.HasProp("__ProductIdProxyArray"))
                this.__ProductIdProxyArray := Win32FixedArray(this.ptr + 8, 16, Primitive, "char")
            return this.__ProductIdProxyArray
        }
    }

    /**
     * The product revision, as defined by the vendor.
     * @type {Array<Byte>}
     */
    Revision{
        get {
            if(!this.HasProp("__RevisionProxyArray"))
                this.__RevisionProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "char")
            return this.__RevisionProxyArray
        }
    }

    /**
     * A unique value used to globally identify this device, as defined by the vendor.
     * @type {Array<Byte>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 28, 32, Primitive, "char")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * The device type of data transports, as defined by SCSI-2. This member must be <b>FILE_DEVICE_CHANGER</b>.
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }
}
