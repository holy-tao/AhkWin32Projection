#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WHEA_ERROR_SOURCE_CONFIGURATION_DEVICE_DRIVER extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    SourceGuid {
        get {
            if(!this.HasProp("__SourceGuid"))
                this.__SourceGuid := Guid(4, this)
            return this.__SourceGuid
        }
    }

    /**
     * @type {Integer}
     */
    LogTag {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 22, 6, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_INITIALIZE_DEVICE_DRIVER>}
     */
    Initialize {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<WHEA_ERROR_SOURCE_UNINITIALIZE_DEVICE_DRIVER>}
     */
    Uninitialize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    MaxSectionDataLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MaxSectionsPerReport {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Guid}
     */
    CreatorId {
        get {
            if(!this.HasProp("__CreatorId"))
                this.__CreatorId := Guid(56, this)
            return this.__CreatorId
        }
    }

    /**
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(72, this)
            return this.__PartitionId
        }
    }
}
