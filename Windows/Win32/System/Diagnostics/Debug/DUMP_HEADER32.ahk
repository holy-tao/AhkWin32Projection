#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PHYSICAL_MEMORY_RUN32.ahk" { PHYSICAL_MEMORY_RUN32 }
#Import ".\EXCEPTION_RECORD32.ahk" { EXCEPTION_RECORD32 }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\DUMP_FILE_ATTRIBUTES.ahk" { DUMP_FILE_ATTRIBUTES }
#Import ".\PHYSICAL_MEMORY_DESCRIPTOR32.ahk" { PHYSICAL_MEMORY_DESCRIPTOR32 }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DUMP_HEADER32 {
    #StructPack 8

    Signature : UInt32

    ValidDump : UInt32

    MajorVersion : UInt32

    MinorVersion : UInt32

    DirectoryTableBase : UInt32

    PfnDataBase : UInt32

    PsLoadedModuleList : UInt32

    PsActiveProcessHead : UInt32

    MachineImageType : UInt32

    NumberProcessors : UInt32

    BugCheckCode : UInt32

    BugCheckParameter1 : UInt32

    BugCheckParameter2 : UInt32

    BugCheckParameter3 : UInt32

    BugCheckParameter4 : UInt32

    VersionUser : CHAR[32]

    PaeEnabled : Int8

    KdSecondaryVersion : Int8

    Spare3 : Int8[2]

    KdDebuggerDataBlock : UInt32

    PhysicalMemoryBlock : PHYSICAL_MEMORY_DESCRIPTOR32

    ContextRecord : Int8[1200]

    Exception : EXCEPTION_RECORD32

    Comment : CHAR[128]

    Attributes : DUMP_FILE_ATTRIBUTES

    BootId : UInt32

    _reserved0 : Int8[1760]

    DumpType : UInt32

    MiniDumpFields : UInt32

    SecondaryDataState : UInt32

    ProductType : UInt32

    SuiteMask : UInt32

    WriterStatus : UInt32

    RequiredDumpSpace : Int64

    _reserved2 : Int8[16]

    SystemUpTime : Int64

    SystemTime : Int64

    _reserved3 : Int8[56]

    static __New() {
        DefineProp(this.Prototype, 'PhysicalMemoryBlockBuffer', { type: Int8[700], offset: 100 })
        this.DeleteProp("__New")
    }
}
