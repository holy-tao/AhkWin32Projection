#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WHEA_ERROR_SEVERITY.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_RECORD_HEADER extends Win32Struct {
    static sizeof => 160

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    Revision {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SignatureEnd {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SectionCount {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {WHEA_ERROR_SEVERITY}
     */
    Severity {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    ValidBits {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    Timestamp {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Guid}
     */
    PlatformId {
        get {
            if(!this.HasProp("__PlatformId"))
                this.__PlatformId := Guid(56, this)
            return this.__PlatformId
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

    /**
     * @type {Guid}
     */
    CreatorId {
        get {
            if(!this.HasProp("__CreatorId"))
                this.__CreatorId := Guid(88, this)
            return this.__CreatorId
        }
    }

    /**
     * @type {Guid}
     */
    NotifyType {
        get {
            if(!this.HasProp("__NotifyType"))
                this.__NotifyType := Guid(104, this)
            return this.__NotifyType
        }
    }

    /**
     * @type {Integer}
     */
    RecordId {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Pointer}
     */
    Flags {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer}
     */
    PersistenceInfo {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    OsBuildNumber {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved2 {
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 148, 8, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 144, 12, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
