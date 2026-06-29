#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FS_FILTER_SECTION_SYNC_TYPE.ahk" { FS_FILTER_SECTION_SYNC_TYPE }
#Import "..\..\Foundation\ERESOURCE.ahk" { ERESOURCE }
#Import "..\..\Foundation\IRP.ahk" { IRP }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }
#Import ".\FS_FILTER_SECTION_SYNC_OUTPUT.ahk" { FS_FILTER_SECTION_SYNC_OUTPUT }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FS_FILTER_PARAMETERS {
    #StructPack 8


    struct _AcquireForModifiedPageWriter {
        EndingOffset : IntPtr

        ResourceToRelease : IntPtr

    }

    struct _ReleaseForModifiedPageWriter {
        ResourceToRelease : ERESOURCE.Ptr

    }

    struct _AcquireForSectionSynchronization {
        SyncType : FS_FILTER_SECTION_SYNC_TYPE

        PageProtection : UInt32

        OutputInformation : FS_FILTER_SECTION_SYNC_OUTPUT.Ptr

        Flags : UInt32

        AllocationAttributes : UInt32

    }

    struct _QueryOpen {
        Irp : IRP.Ptr

        FileInformation : IntPtr

        Length : IntPtr

        FileInformationClass : FILE_INFORMATION_CLASS

        CompletionStatus : NTSTATUS

    }

    struct _Others {
        Argument1 : IntPtr

        Argument2 : IntPtr

        Argument3 : IntPtr

        Argument4 : IntPtr

        Argument5 : IntPtr

    }

    AcquireForModifiedPageWriter : FS_FILTER_PARAMETERS._AcquireForModifiedPageWriter

    static __New() {
        DefineProp(this.Prototype, 'ReleaseForModifiedPageWriter', { type: FS_FILTER_PARAMETERS._ReleaseForModifiedPageWriter, offset: 0 })
        DefineProp(this.Prototype, 'AcquireForSectionSynchronization', { type: FS_FILTER_PARAMETERS._AcquireForSectionSynchronization, offset: 0 })
        DefineProp(this.Prototype, 'QueryOpen', { type: FS_FILTER_PARAMETERS._QueryOpen, offset: 0 })
        DefineProp(this.Prototype, 'Others', { type: FS_FILTER_PARAMETERS._Others, offset: 0 })
        this.DeleteProp("__New")
    }
}
