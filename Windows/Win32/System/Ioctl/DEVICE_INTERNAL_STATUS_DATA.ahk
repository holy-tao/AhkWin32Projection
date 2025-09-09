#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DEVICE_INTERNAL_STATUS_DATA extends Win32Struct
{
    static sizeof => 176

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
    T10VendorId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DataSet1Length {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    DataSet2Length {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DataSet3Length {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DataSet4Length {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    StatusDataVersion {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 33, 3, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReasonIdentifier{
        get {
            if(!this.HasProp("__ReasonIdentifierProxyArray"))
                this.__ReasonIdentifierProxyArray := Win32FixedArray(this.ptr + 36, 128, Primitive, "char")
            return this.__ReasonIdentifierProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    StatusDataLength {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Array<Byte>}
     */
    StatusData{
        get {
            if(!this.HasProp("__StatusDataProxyArray"))
                this.__StatusDataProxyArray := Win32FixedArray(this.ptr + 168, 1, Primitive, "char")
            return this.__StatusDataProxyArray
        }
    }
}
