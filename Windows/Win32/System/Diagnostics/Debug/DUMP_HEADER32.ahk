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
    static sizeof => 3432

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
     * @type {Array<SByte>}
     */
    VersionUser{
        get {
            if(!this.HasProp("__VersionUserProxyArray"))
                this.__VersionUserProxyArray := Win32FixedArray(this.ptr + 60, 32, Primitive, "char")
            return this.__VersionUserProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PaeEnabled {
        get => NumGet(this, 92, "char")
        set => NumPut("char", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    KdSecondaryVersion {
        get => NumGet(this, 93, "char")
        set => NumPut("char", value, this, 93)
    }

    /**
     * @type {Array<Byte>}
     */
    Spare3{
        get {
            if(!this.HasProp("__Spare3ProxyArray"))
                this.__Spare3ProxyArray := Win32FixedArray(this.ptr + 94, 2, Primitive, "char")
            return this.__Spare3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    KdDebuggerDataBlock {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {PHYSICAL_MEMORY_DESCRIPTOR32}
     */
    PhysicalMemoryBlock{
        get {
            if(!this.HasProp("__PhysicalMemoryBlock"))
                this.__PhysicalMemoryBlock := PHYSICAL_MEMORY_DESCRIPTOR32(this.ptr + 104)
            return this.__PhysicalMemoryBlock
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PhysicalMemoryBlockBuffer{
        get {
            if(!this.HasProp("__PhysicalMemoryBlockBufferProxyArray"))
                this.__PhysicalMemoryBlockBufferProxyArray := Win32FixedArray(this.ptr + 104, 700, Primitive, "char")
            return this.__PhysicalMemoryBlockBufferProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ContextRecord{
        get {
            if(!this.HasProp("__ContextRecordProxyArray"))
                this.__ContextRecordProxyArray := Win32FixedArray(this.ptr + 124, 1200, Primitive, "char")
            return this.__ContextRecordProxyArray
        }
    }

    /**
     * @type {EXCEPTION_RECORD32}
     */
    Exception{
        get {
            if(!this.HasProp("__Exception"))
                this.__Exception := EXCEPTION_RECORD32(this.ptr + 1328)
            return this.__Exception
        }
    }

    /**
     * @type {Array<SByte>}
     */
    Comment{
        get {
            if(!this.HasProp("__CommentProxyArray"))
                this.__CommentProxyArray := Win32FixedArray(this.ptr + 1408, 128, Primitive, "char")
            return this.__CommentProxyArray
        }
    }

    /**
     * @type {DUMP_FILE_ATTRIBUTES}
     */
    Attributes{
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := DUMP_FILE_ATTRIBUTES(this.ptr + 1536)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    BootId {
        get => NumGet(this, 1544, "uint")
        set => NumPut("uint", value, this, 1544)
    }

    /**
     * @type {Array<Byte>}
     */
    _reserved0{
        get {
            if(!this.HasProp("___reserved0ProxyArray"))
                this.___reserved0ProxyArray := Win32FixedArray(this.ptr + 1548, 1760, Primitive, "char")
            return this.___reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DumpType {
        get => NumGet(this, 3308, "uint")
        set => NumPut("uint", value, this, 3308)
    }

    /**
     * @type {Integer}
     */
    MiniDumpFields {
        get => NumGet(this, 3312, "uint")
        set => NumPut("uint", value, this, 3312)
    }

    /**
     * @type {Integer}
     */
    SecondaryDataState {
        get => NumGet(this, 3316, "uint")
        set => NumPut("uint", value, this, 3316)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 3320, "uint")
        set => NumPut("uint", value, this, 3320)
    }

    /**
     * @type {Integer}
     */
    SuiteMask {
        get => NumGet(this, 3324, "uint")
        set => NumPut("uint", value, this, 3324)
    }

    /**
     * @type {Integer}
     */
    WriterStatus {
        get => NumGet(this, 3328, "uint")
        set => NumPut("uint", value, this, 3328)
    }

    /**
     * @type {Integer}
     */
    RequiredDumpSpace {
        get => NumGet(this, 3336, "int64")
        set => NumPut("int64", value, this, 3336)
    }

    /**
     * @type {Array<Byte>}
     */
    _reserved2{
        get {
            if(!this.HasProp("___reserved2ProxyArray"))
                this.___reserved2ProxyArray := Win32FixedArray(this.ptr + 3344, 16, Primitive, "char")
            return this.___reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SystemUpTime {
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
     * @type {Array<Byte>}
     */
    _reserved3{
        get {
            if(!this.HasProp("___reserved3ProxyArray"))
                this.___reserved3ProxyArray := Win32FixedArray(this.ptr + 3376, 56, Primitive, "char")
            return this.___reserved3ProxyArray
        }
    }
}
