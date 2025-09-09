#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_MEMORY_RUN64.ahk
#Include .\PHYSICAL_MEMORY_DESCRIPTOR64.ahk
#Include .\EXCEPTION_RECORD64.ahk
#Include .\DUMP_FILE_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DUMP_HEADER64 extends Win32Struct
{
    static sizeof => 7688

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Signature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ValidDump {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    DirectoryTableBase {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    PfnDataBase {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PsLoadedModuleList {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    PsActiveProcessHead {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    MachineImageType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    NumberProcessors {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    BugCheckCode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter1 {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter2 {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter3 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter4 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {String}
     */
    VersionUser {
        get => StrGet(this.ptr + 96, 31, "UTF-16")
        set => StrPut(value, this.ptr + 96, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    KdDebuggerDataBlock {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {PHYSICAL_MEMORY_DESCRIPTOR64}
     */
    PhysicalMemoryBlock{
        get {
            if(!this.HasProp("__PhysicalMemoryBlock"))
                this.__PhysicalMemoryBlock := PHYSICAL_MEMORY_DESCRIPTOR64(this.ptr + 168)
            return this.__PhysicalMemoryBlock
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PhysicalMemoryBlockBuffer{
        get {
            if(!this.HasProp("__PhysicalMemoryBlockBufferProxyArray"))
                this.__PhysicalMemoryBlockBufferProxyArray := Win32FixedArray(this.ptr + 168, 700, Primitive, "char")
            return this.__PhysicalMemoryBlockBufferProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ContextRecord{
        get {
            if(!this.HasProp("__ContextRecordProxyArray"))
                this.__ContextRecordProxyArray := Win32FixedArray(this.ptr + 196, 3000, Primitive, "char")
            return this.__ContextRecordProxyArray
        }
    }

    /**
     * @type {EXCEPTION_RECORD64}
     */
    Exception{
        get {
            if(!this.HasProp("__Exception"))
                this.__Exception := EXCEPTION_RECORD64(this.ptr + 3200)
            return this.__Exception
        }
    }

    /**
     * @type {Integer}
     */
    DumpType {
        get => NumGet(this, 3352, "uint")
        set => NumPut("uint", value, this, 3352)
    }

    /**
     * @type {Integer}
     */
    RequiredDumpSpace {
        get => NumGet(this, 3360, "int64")
        set => NumPut("int64", value, this, 3360)
    }

    /**
     * @type {Integer}
     */
    SystemTime {
        get => NumGet(this, 3368, "int64")
        set => NumPut("int64", value, this, 3368)
    }

    /**
     * @type {String}
     */
    Comment {
        get => StrGet(this.ptr + 3376, 127, "UTF-16")
        set => StrPut(value, this.ptr + 3376, 127, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    SystemUpTime {
        get => NumGet(this, 3632, "int64")
        set => NumPut("int64", value, this, 3632)
    }

    /**
     * @type {Integer}
     */
    MiniDumpFields {
        get => NumGet(this, 3640, "uint")
        set => NumPut("uint", value, this, 3640)
    }

    /**
     * @type {Integer}
     */
    SecondaryDataState {
        get => NumGet(this, 3644, "uint")
        set => NumPut("uint", value, this, 3644)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 3648, "uint")
        set => NumPut("uint", value, this, 3648)
    }

    /**
     * @type {Integer}
     */
    SuiteMask {
        get => NumGet(this, 3652, "uint")
        set => NumPut("uint", value, this, 3652)
    }

    /**
     * @type {Integer}
     */
    WriterStatus {
        get => NumGet(this, 3656, "uint")
        set => NumPut("uint", value, this, 3656)
    }

    /**
     * @type {Integer}
     */
    Unused1 {
        get => NumGet(this, 3660, "char")
        set => NumPut("char", value, this, 3660)
    }

    /**
     * @type {Integer}
     */
    KdSecondaryVersion {
        get => NumGet(this, 3661, "char")
        set => NumPut("char", value, this, 3661)
    }

    /**
     * @type {Array<Byte>}
     */
    Unused{
        get {
            if(!this.HasProp("__UnusedProxyArray"))
                this.__UnusedProxyArray := Win32FixedArray(this.ptr + 3662, 2, Primitive, "char")
            return this.__UnusedProxyArray
        }
    }

    /**
     * @type {DUMP_FILE_ATTRIBUTES}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := DUMP_FILE_ATTRIBUTES(this.ptr + 3664)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    BootId {
        get => NumGet(this, 3672, "uint")
        set => NumPut("uint", value, this, 3672)
    }

    /**
     * @type {Array<Byte>}
     */
    _reserved0{
        get {
            if(!this.HasProp("___reserved0ProxyArray"))
                this.___reserved0ProxyArray := Win32FixedArray(this.ptr + 3676, 4008, Primitive, "char")
            return this.___reserved0ProxyArray
        }
    }
}
