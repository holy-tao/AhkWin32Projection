#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PHYSICAL_MEMORY_RUN64.ahk" { PHYSICAL_MEMORY_RUN64 }
#Import ".\EXCEPTION_RECORD64.ahk" { EXCEPTION_RECORD64 }
#Import ".\DUMP_FILE_ATTRIBUTES.ahk" { DUMP_FILE_ATTRIBUTES }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\PHYSICAL_MEMORY_DESCRIPTOR64.ahk" { PHYSICAL_MEMORY_DESCRIPTOR64 }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DUMP_HEADER64 {
    #StructPack 8

    Signature : UInt32

    ValidDump : UInt32

    MajorVersion : UInt32

    MinorVersion : UInt32

    DirectoryTableBase : Int64

    PfnDataBase : Int64

    PsLoadedModuleList : Int64

    PsActiveProcessHead : Int64

    MachineImageType : UInt32

    NumberProcessors : UInt32

    BugCheckCode : UInt32

    BugCheckParameter1 : Int64

    BugCheckParameter2 : Int64

    BugCheckParameter3 : Int64

    BugCheckParameter4 : Int64

    VersionUser : CHAR[32]

    KdDebuggerDataBlock : Int64

    PhysicalMemoryBlock : PHYSICAL_MEMORY_DESCRIPTOR64

    ContextRecord : Int8[3000]

    Exception : EXCEPTION_RECORD64

    DumpType : UInt32

    RequiredDumpSpace : Int64

    SystemTime : Int64

    Comment : CHAR[128]

    SystemUpTime : Int64

    MiniDumpFields : UInt32

    SecondaryDataState : UInt32

    ProductType : UInt32

    SuiteMask : UInt32

    WriterStatus : UInt32

    Unused1 : Int8

    KdSecondaryVersion : Int8

    Unused : Int8[2]

    Attributes : DUMP_FILE_ATTRIBUTES

    BootId : UInt32

    _reserved0 : Int8[4008]

    static __New() {
        DefineProp(this.Prototype, 'PhysicalMemoryBlockBuffer', { type: Int8[700], offset: 136 })
        this.DeleteProp("__New")
    }
}
