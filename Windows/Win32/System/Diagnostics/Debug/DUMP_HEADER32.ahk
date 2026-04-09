#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PHYSICAL_MEMORY_DESCRIPTOR32.ahk
#Include .\PHYSICAL_MEMORY_RUN32.ahk
#Include .\EXCEPTION_RECORD32.ahk
#Include .\DUMP_FILE_ATTRIBUTES.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class DUMP_HEADER32 extends Win32Struct {
    static sizeof => 4104

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
        get => StrGet(this.ptr + 60, 31, "UTF-8")
        set => StrPut(value, this.ptr + 60, 31, "UTF-8")
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
     * @type {Array<Integer>}
     */
    Spare3 {
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
    PhysicalMemoryBlock {
        get {
            if(!this.HasProp("__PhysicalMemoryBlock"))
                this.__PhysicalMemoryBlock := PHYSICAL_MEMORY_DESCRIPTOR32(100, this)
            return this.__PhysicalMemoryBlock
        }
    }

    /**
     * @type {Array<Integer>}
     */
    PhysicalMemoryBlockBuffer {
        get {
            if(!this.HasProp("__PhysicalMemoryBlockBufferProxyArray"))
                this.__PhysicalMemoryBlockBufferProxyArray := Win32FixedArray(this.ptr + 100, 700, Primitive, "char")
            return this.__PhysicalMemoryBlockBufferProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    ContextRecord {
        get {
            if(!this.HasProp("__ContextRecordProxyArray"))
                this.__ContextRecordProxyArray := Win32FixedArray(this.ptr + 800, 1200, Primitive, "char")
            return this.__ContextRecordProxyArray
        }
    }

    /**
     * @type {EXCEPTION_RECORD32}
     */
    Exception {
        get {
            if(!this.HasProp("__Exception"))
                this.__Exception := EXCEPTION_RECORD32(2000, this)
            return this.__Exception
        }
    }

    /**
     * @type {String}
     */
    Comment {
        get => StrGet(this.ptr + 2080, 127, "UTF-8")
        set => StrPut(value, this.ptr + 2080, 127, "UTF-8")
    }

    /**
     * @type {DUMP_FILE_ATTRIBUTES}
     */
    Attributes {
        get {
            if(!this.HasProp("__Attributes"))
                this.__Attributes := DUMP_FILE_ATTRIBUTES(2208, this)
            return this.__Attributes
        }
    }

    /**
     * @type {Integer}
     */
    BootId {
        get => NumGet(this, 2216, "uint")
        set => NumPut("uint", value, this, 2216)
    }

    /**
     * @type {Array<Integer>}
     */
    _reserved0 {
        get {
            if(!this.HasProp("___reserved0ProxyArray"))
                this.___reserved0ProxyArray := Win32FixedArray(this.ptr + 2220, 1760, Primitive, "char")
            return this.___reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DumpType {
        get => NumGet(this, 3980, "uint")
        set => NumPut("uint", value, this, 3980)
    }

    /**
     * @type {Integer}
     */
    MiniDumpFields {
        get => NumGet(this, 3984, "uint")
        set => NumPut("uint", value, this, 3984)
    }

    /**
     * @type {Integer}
     */
    SecondaryDataState {
        get => NumGet(this, 3988, "uint")
        set => NumPut("uint", value, this, 3988)
    }

    /**
     * @type {Integer}
     */
    ProductType {
        get => NumGet(this, 3992, "uint")
        set => NumPut("uint", value, this, 3992)
    }

    /**
     * @type {Integer}
     */
    SuiteMask {
        get => NumGet(this, 3996, "uint")
        set => NumPut("uint", value, this, 3996)
    }

    /**
     * @type {Integer}
     */
    WriterStatus {
        get => NumGet(this, 4000, "uint")
        set => NumPut("uint", value, this, 4000)
    }

    /**
     * @type {Integer}
     */
    RequiredDumpSpace {
        get => NumGet(this, 4008, "int64")
        set => NumPut("int64", value, this, 4008)
    }

    /**
     * @type {Array<Integer>}
     */
    _reserved2 {
        get {
            if(!this.HasProp("___reserved2ProxyArray"))
                this.___reserved2ProxyArray := Win32FixedArray(this.ptr + 4016, 16, Primitive, "char")
            return this.___reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SystemUpTime {
        get => NumGet(this, 4032, "int64")
        set => NumPut("int64", value, this, 4032)
    }

    /**
     * @type {Integer}
     */
    SystemTime {
        get => NumGet(this, 4040, "int64")
        set => NumPut("int64", value, this, 4040)
    }

    /**
     * @type {Array<Integer>}
     */
    _reserved3 {
        get {
            if(!this.HasProp("___reserved3ProxyArray"))
                this.___reserved3ProxyArray := Win32FixedArray(this.ptr + 4048, 56, Primitive, "char")
            return this.___reserved3ProxyArray
        }
    }
}
