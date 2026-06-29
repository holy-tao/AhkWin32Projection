#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
#Include .\WHEA_ERROR_SOURCE_CONFIGURATION_DD.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WHEA_DEVICE_DRIVER_DESCRIPTOR extends Win32Struct {
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    Enabled {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
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
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    PacketLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PacketCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<Integer>}
     */
    PacketBuffer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {WHEA_ERROR_SOURCE_CONFIGURATION_DD}
     */
    Config {
        get {
            if(!this.HasProp("__Config"))
                this.__Config := WHEA_ERROR_SOURCE_CONFIGURATION_DD(40, this)
            return this.__Config
        }
    }

    /**
     * @type {Guid}
     */
    CreatorId {
        get {
            if(!this.HasProp("__CreatorId"))
                this.__CreatorId := Guid(64, this)
            return this.__CreatorId
        }
    }

    /**
     * @type {Guid}
     */
    PartitionId {
        get {
            if(!this.HasProp("__PartitionId"))
                this.__PartitionId := Guid(80, this)
            return this.__PartitionId
        }
    }

    /**
     * @type {Integer}
     */
    MaxSectionDataLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MaxSectionsPerRecord {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Pointer<Integer>}
     */
    PacketStateBuffer {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    OpenHandles {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }
}
