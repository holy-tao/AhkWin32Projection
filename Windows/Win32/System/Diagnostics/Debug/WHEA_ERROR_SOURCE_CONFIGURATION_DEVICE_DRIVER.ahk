#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER extends Win32Struct
{
    static sizeof => 60

    static packingSize => 1

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    SourceGuid {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    LogTag {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 14, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER>}
     */
    Initialize {
        get => NumGet(this, 20, "ptr")
        set => NumPut("ptr", value, this, 20)
    }

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER>}
     */
    Uninitialize {
        get => NumGet(this, 28, "ptr")
        set => NumPut("ptr", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MaxSectionDataLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    MaxSectionsPerReport {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Guid>}
     */
    CreatorId {
        get => NumGet(this, 44, "ptr")
        set => NumPut("ptr", value, this, 44)
    }

    /**
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 52, "ptr")
        set => NumPut("ptr", value, this, 52)
    }
}
