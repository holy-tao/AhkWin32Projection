#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_PERSISTENT_EVENT_LOG_HEADER extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LogIdentifier {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    TotalNumberOfEvents {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TotalLogLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    LogRevision {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    LogHeaderLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    Timestamp {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    PowerOnHours{
        get {
            if(!this.HasProp("__PowerOnHoursProxyArray"))
                this.__PowerOnHoursProxyArray := Win32FixedArray(this.ptr + 32, 16, Primitive, "char")
            return this.__PowerOnHoursProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PowerCycleCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    PciVendorId {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    PciSubsystemVendorId {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }

    /**
     * @type {Array<Byte>}
     */
    SerialNumber{
        get {
            if(!this.HasProp("__SerialNumberProxyArray"))
                this.__SerialNumberProxyArray := Win32FixedArray(this.ptr + 60, 20, Primitive, "char")
            return this.__SerialNumberProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ModelNumber{
        get {
            if(!this.HasProp("__ModelNumberProxyArray"))
                this.__ModelNumberProxyArray := Win32FixedArray(this.ptr + 80, 40, Primitive, "char")
            return this.__ModelNumberProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    NVMSubsystemNVMeQualifiedName{
        get {
            if(!this.HasProp("__NVMSubsystemNVMeQualifiedNameProxyArray"))
                this.__NVMSubsystemNVMeQualifiedNameProxyArray := Win32FixedArray(this.ptr + 120, 256, Primitive, "char")
            return this.__NVMSubsystemNVMeQualifiedNameProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 376, 108, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    SupportedEventsBitmap{
        get {
            if(!this.HasProp("__SupportedEventsBitmapProxyArray"))
                this.__SupportedEventsBitmapProxyArray := Win32FixedArray(this.ptr + 484, 32, Primitive, "char")
            return this.__SupportedEventsBitmapProxyArray
        }
    }
}
