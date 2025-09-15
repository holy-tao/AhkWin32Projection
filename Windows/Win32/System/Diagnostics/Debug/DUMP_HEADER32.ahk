#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_MEMORY_RUN32.ahk
#Include .\PHYSICAL_MEMORY_DESCRIPTOR32.ahk
#Include .\EXCEPTION_RECORD32.ahk
#Include .\DUMP_FILE_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class DUMP_HEADER32 extends Win32Struct
{
    static sizeof => 3592

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
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    PsLoadedModuleList {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    PsActiveProcessHead {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MachineImageType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    NumberProcessors {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    BugCheckCode {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter1 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter2 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter3 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    BugCheckParameter4 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {String}
     */
    VersionUser {
        get => StrGet(this.ptr + 60, 31, "UTF-16")
        set => StrPut(value, this.ptr + 60, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    PaeEnabled {
        get => NumGet(this, 124, "char")
        set => NumPut("char", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    KdSecondaryVersion {
        get => NumGet(this, 125, "char")
        set => NumPut("char", value, this, 125)
    }

    /**
     * @type {Array<Byte>}
     */
    Spare3{
        get {
            if(!this.HasProp("__Spare3ProxyArray"))
                this.__Spare3ProxyArray := Win32FixedArray(this.ptr + 126, 2, Primitive, "char")
            return this.__Spare3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    KdDebuggerDataBlock {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {PHYSICAL_MEMORY_DESCRIPTOR32}
     */
    PhysicalMemoryBlock{
        get {
            if(!this.HasProp("__PhysicalMemoryBlock"))
                this.__PhysicalMemoryBlock := PHYSICAL_MEMORY_DESCRIPTOR32(this.ptr + 136)
            return this.__PhysicalMemoryBlock
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PhysicalMemoryBlockBuffer{
        get {
            if(!this.HasProp("__PhysicalMemoryBlockBufferProxyArray"))
                this.__PhysicalMemoryBlockBufferProxyArray := Win32FixedArray(this.ptr + 136, 700, Primitive, "char")
            return this.__PhysicalMemoryBlockBufferProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ContextRecord{
        get {
            if(!this.HasProp("__ContextRecordProxyArray"))
                this.__ContextRecordProxyArray := Win32FixedArray(this.ptr + 156, 1200, Primitive, "char")
            return this.__ContextRecordProxyArray
        }
    }

    /**
     * @type {EXCEPTION_RECORD32}
     */
    Exception{
        get {
            if(!this.HasProp("__Exception"))
                this.__Exception := EXCEPTION_RECORD32(this.ptr + 1360)
            return this.__Exception
        }
    }

    /**
     * @type {String}
     */
    Comment {
        get => StrGet(this.ptr + 1440, 127, "UTF-16")
        set => StrPut(value, this.ptr + 1440, 127, "UTF-16")
    }

    /**
     * @type {DUMP_FILE_ATTRIBUTES}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := DUMP_FILE_ATTRIBUTES(this.ptr + 1696)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    BootId {
        get => NumGet(this, 1704, "uint")
        set => NumPut("uint", value, this, 1704)
    }

    /**
     * @type {Array<Byte>}
     */
    _reserved0{
        get {
            if(!this.HasProp("___reserved0ProxyArray"))
                this.___reserved0ProxyArray := Win32FixedArray(this.ptr + 1708, 1760, Primitive, "char")
            return this.___reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DumpType {
        get => NumGet(this, 3468, "uint")
        set => NumPut("uint", value, this, 3468)
    }

    /**
     * @type {Integer}
     */
    MiniDumpFields {
        get => NumGet(this, 3472, "uint")
        set => NumPut("uint", value, this, 3472)
    }

    /**
     * @type {Integer}
     */
    SecondaryDataState {
        get => NumGet(this, 3476, "uint")
        set => NumPut("uint", value, this, 3476)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 3480, "uint")
        set => NumPut("uint", value, this, 3480)
    }

    /**
     * @type {Integer}
     */
    SuiteMask {
        get => NumGet(this, 3484, "uint")
        set => NumPut("uint", value, this, 3484)
    }

    /**
     * @type {Integer}
     */
    WriterStatus {
        get => NumGet(this, 3488, "uint")
        set => NumPut("uint", value, this, 3488)
    }

    /**
     * @type {Integer}
     */
    RequiredDumpSpace {
        get => NumGet(this, 3496, "int64")
        set => NumPut("int64", value, this, 3496)
    }

    /**
     * @type {Array<Byte>}
     */
    _reserved2{
        get {
            if(!this.HasProp("___reserved2ProxyArray"))
                this.___reserved2ProxyArray := Win32FixedArray(this.ptr + 3504, 16, Primitive, "char")
            return this.___reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SystemUpTime {
        get => NumGet(this, 3520, "int64")
        set => NumPut("int64", value, this, 3520)
    }

    /**
     * @type {Integer}
     */
    SystemTime {
        get => NumGet(this, 3528, "int64")
        set => NumPut("int64", value, this, 3528)
    }

    /**
     * @type {Array<Byte>}
     */
    _reserved3{
        get {
            if(!this.HasProp("___reserved3ProxyArray"))
                this.___reserved3ProxyArray := Win32FixedArray(this.ptr + 3536, 56, Primitive, "char")
            return this.___reserved3ProxyArray
        }
    }
}
