#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\System\SystemServices\CM_RESOURCE_LIST.ahk" { CM_RESOURCE_LIST }
#Import "..\..\..\System\SystemServices\DEVICE_USAGE_NOTIFICATION_TYPE.ahk" { DEVICE_USAGE_NOTIFICATION_TYPE }
#Import "..\FS_FILTER_SECTION_SYNC_TYPE.ahk" { FS_FILTER_SECTION_SYNC_TYPE }
#Import "..\..\..\System\SystemServices\BUS_QUERY_ID_TYPE.ahk" { BUS_QUERY_ID_TYPE }
#Import "..\..\..\Foundation\MDL.ahk" { MDL }
#Import "..\..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\System\SystemServices\DEVICE_TEXT_TYPE.ahk" { DEVICE_TEXT_TYPE }
#Import "..\FS_INFORMATION_CLASS.ahk" { FS_INFORMATION_CLASS }
#Import "..\FS_FILTER_SECTION_SYNC_OUTPUT.ahk" { FS_FILTER_SECTION_SYNC_OUTPUT }
#Import "..\..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\IO_SECURITY_CONTEXT.ahk" { IO_SECURITY_CONTEXT }
#Import "..\..\..\Foundation\ERESOURCE.ahk" { ERESOURCE }
#Import "..\..\..\System\SystemServices\DIRECTORY_NOTIFY_INFORMATION_CLASS.ahk" { DIRECTORY_NOTIFY_INFORMATION_CLASS }
#Import "..\..\..\Foundation\VPB.ahk" { VPB }
#Import "..\..\..\System\SystemServices\IO_RESOURCE_REQUIREMENTS_LIST.ahk" { IO_RESOURCE_REQUIREMENTS_LIST }
#Import "..\FILE_NETWORK_OPEN_INFORMATION.ahk" { FILE_NETWORK_OPEN_INFORMATION }
#Import "..\..\..\..\Win32\Security\PSID.ahk" { PSID }
#Import "..\..\..\System\SystemServices\DEVICE_CAPABILITIES.ahk" { DEVICE_CAPABILITIES }
#Import "..\..\..\System\SystemServices\DEVICE_RELATION_TYPE.ahk" { DEVICE_RELATION_TYPE }
#Import "..\FILE_GET_QUOTA_INFORMATION.ahk" { FILE_GET_QUOTA_INFORMATION }
#Import "..\..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\..\Foundation\PEPROCESS.ahk" { PEPROCESS }
#Import "..\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }
#Import "..\..\..\Foundation\IRP.ahk" { IRP }
#Import "..\..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\..\System\SystemServices\INTERFACE.ahk" { INTERFACE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_PARAMETERS {
    #StructPack 8


    struct _Create {
        SecurityContext : IO_SECURITY_CONTEXT.Ptr

        Options : UInt32

        FileAttributes : UInt16

        ShareAccess : UInt16

        EaLength : UInt32

        EaBuffer : IntPtr

        AllocationSize : Int64

    }

    struct _CreatePipe {
        SecurityContext : IO_SECURITY_CONTEXT.Ptr

        Options : UInt32

        Reserved : UInt16

        ShareAccess : UInt16

        Parameters : IntPtr

    }

    struct _CreateMailslot {
        SecurityContext : IO_SECURITY_CONTEXT.Ptr

        Options : UInt32

        Reserved : UInt16

        ShareAccess : UInt16

        Parameters : IntPtr

    }

    struct _Read {
        Length : UInt32

        Key : UInt32

        ByteOffset : Int64

        ReadBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _Write {
        Length : UInt32

        Key : UInt32

        ByteOffset : Int64

        WriteBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _QueryFileInformation {
        Length : UInt32

        FileInformationClass : FILE_INFORMATION_CLASS

        InfoBuffer : IntPtr

    }

    struct _SetFileInformation {
        Length : UInt32

        FileInformationClass : FILE_INFORMATION_CLASS

        ParentOfTarget : FILE_OBJECT.Ptr

        ReplaceIfExists : BOOLEAN

        AdvanceOnly : BOOLEAN

        InfoBuffer : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'ClusterCount', { type: UInt32, offset: 16 })
            DefineProp(this.Prototype, 'DeleteHandle', { type: HANDLE, offset: 16 })
            this.DeleteProp("__New")
        }
    }

    struct _QueryEa {
        Length : UInt32

        EaList : IntPtr

        EaListLength : UInt32

        EaIndex : UInt32

        EaBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _SetEa {
        Length : UInt32

        EaBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _QueryVolumeInformation {
        Length : UInt32

        FsInformationClass : FS_INFORMATION_CLASS

        VolumeBuffer : IntPtr

    }

    struct _SetVolumeInformation {
        Length : UInt32

        FsInformationClass : FS_INFORMATION_CLASS

        VolumeBuffer : IntPtr

    }

    struct _DirectoryControl {

        struct _QueryDirectory {
            Length : UInt32

            FileName : UNICODE_STRING.Ptr

            FileInformationClass : FILE_INFORMATION_CLASS

            FileIndex : UInt32

            DirectoryBuffer : IntPtr

            MdlAddress : MDL.Ptr

        }

        struct _NotifyDirectory {
            Length : UInt32

            CompletionFilter : UInt32

            Spare1 : UInt32

            Spare2 : UInt32

            DirectoryBuffer : IntPtr

            MdlAddress : MDL.Ptr

        }

        struct _NotifyDirectoryEx {
            Length : UInt32

            CompletionFilter : UInt32

            DirectoryNotifyInformationClass : DIRECTORY_NOTIFY_INFORMATION_CLASS

            Spare2 : UInt32

            DirectoryBuffer : IntPtr

            MdlAddress : MDL.Ptr

        }

        QueryDirectory : FLT_PARAMETERS._DirectoryControl._QueryDirectory

        static __New() {
            DefineProp(this.Prototype, 'NotifyDirectory', { type: FLT_PARAMETERS._DirectoryControl._NotifyDirectory, offset: 0 })
            DefineProp(this.Prototype, 'NotifyDirectoryEx', { type: FLT_PARAMETERS._DirectoryControl._NotifyDirectoryEx, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _FileSystemControl {

        struct _VerifyVolume {
            Vpb : VPB.Ptr

            DeviceObject : DEVICE_OBJECT.Ptr

        }

        struct _Common {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            FsControlCode : UInt32

        }

        struct _Neither {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            FsControlCode : UInt32

            InputBuffer : IntPtr

            OutputBuffer : IntPtr

            OutputMdlAddress : MDL.Ptr

        }

        struct _Buffered {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            FsControlCode : UInt32

            SystemBuffer : IntPtr

        }

        struct _Direct {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            FsControlCode : UInt32

            InputSystemBuffer : IntPtr

            OutputBuffer : IntPtr

            OutputMdlAddress : MDL.Ptr

        }

        VerifyVolume : FLT_PARAMETERS._FileSystemControl._VerifyVolume

        static __New() {
            DefineProp(this.Prototype, 'Common', { type: FLT_PARAMETERS._FileSystemControl._Common, offset: 0 })
            DefineProp(this.Prototype, 'Neither', { type: FLT_PARAMETERS._FileSystemControl._Neither, offset: 0 })
            DefineProp(this.Prototype, 'Buffered', { type: FLT_PARAMETERS._FileSystemControl._Buffered, offset: 0 })
            DefineProp(this.Prototype, 'Direct', { type: FLT_PARAMETERS._FileSystemControl._Direct, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _DeviceIoControl {

        struct _Common {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            IoControlCode : UInt32

        }

        struct _Neither {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            IoControlCode : UInt32

            InputBuffer : IntPtr

            OutputBuffer : IntPtr

            OutputMdlAddress : MDL.Ptr

        }

        struct _Buffered {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            IoControlCode : UInt32

            SystemBuffer : IntPtr

        }

        struct _Direct {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            IoControlCode : UInt32

            InputSystemBuffer : IntPtr

            OutputBuffer : IntPtr

            OutputMdlAddress : MDL.Ptr

        }

        struct _FastIo {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            IoControlCode : UInt32

            InputBuffer : IntPtr

            OutputBuffer : IntPtr

        }

        Common : FLT_PARAMETERS._DeviceIoControl._Common

        static __New() {
            DefineProp(this.Prototype, 'Neither', { type: FLT_PARAMETERS._DeviceIoControl._Neither, offset: 0 })
            DefineProp(this.Prototype, 'Buffered', { type: FLT_PARAMETERS._DeviceIoControl._Buffered, offset: 0 })
            DefineProp(this.Prototype, 'Direct', { type: FLT_PARAMETERS._DeviceIoControl._Direct, offset: 0 })
            DefineProp(this.Prototype, 'FastIo', { type: FLT_PARAMETERS._DeviceIoControl._FastIo, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _LockControl {
        Length : IntPtr

        Key : UInt32

        ByteOffset : Int64

        ProcessId : PEPROCESS

        FailImmediately : BOOLEAN

        ExclusiveLock : BOOLEAN

    }

    struct _QuerySecurity {
        SecurityInformation : UInt32

        Length : UInt32

        SecurityBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _SetSecurity {
        SecurityInformation : UInt32

        SecurityDescriptor : PSECURITY_DESCRIPTOR

    }

    struct _WMI {
        ProviderId : IntPtr

        DataPath : IntPtr

        BufferSize : UInt32

        Buffer : IntPtr

    }

    struct _QueryQuota {
        Length : UInt32

        StartSid : PSID

        SidList : FILE_GET_QUOTA_INFORMATION.Ptr

        SidListLength : UInt32

        QuotaBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _SetQuota {
        Length : UInt32

        QuotaBuffer : IntPtr

        MdlAddress : MDL.Ptr

    }

    struct _Pnp {

        struct _StartDevice {
            AllocatedResources : CM_RESOURCE_LIST.Ptr

            AllocatedResourcesTranslated : CM_RESOURCE_LIST.Ptr

        }

        struct _QueryDeviceRelations {
            Type : DEVICE_RELATION_TYPE

        }

        struct _QueryInterface {
            InterfaceType : Guid.Ptr

            Size : UInt16

            Version : UInt16

            Interface : INTERFACE.Ptr

            InterfaceSpecificData : IntPtr

        }

        struct _DeviceCapabilities {
            Capabilities : DEVICE_CAPABILITIES.Ptr

        }

        struct _FilterResourceRequirements {
            IoResourceRequirementList : IO_RESOURCE_REQUIREMENTS_LIST.Ptr

        }

        struct _ReadWriteConfig {
            WhichSpace : UInt32

            Buffer : IntPtr

            Offset : UInt32

            Length : UInt32

        }

        struct _SetLock {
            Lock : BOOLEAN

        }

        struct _QueryId {
            IdType : BUS_QUERY_ID_TYPE

        }

        struct _QueryDeviceText {
            DeviceTextType : DEVICE_TEXT_TYPE

            LocaleId : UInt32

        }

        struct _UsageNotification {
            InPath : BOOLEAN

            Reserved : BOOLEAN[3]

            Type : DEVICE_USAGE_NOTIFICATION_TYPE

        }

        StartDevice : FLT_PARAMETERS._Pnp._StartDevice

        static __New() {
            DefineProp(this.Prototype, 'QueryDeviceRelations', { type: FLT_PARAMETERS._Pnp._QueryDeviceRelations, offset: 0 })
            DefineProp(this.Prototype, 'QueryInterface', { type: FLT_PARAMETERS._Pnp._QueryInterface, offset: 0 })
            DefineProp(this.Prototype, 'DeviceCapabilities', { type: FLT_PARAMETERS._Pnp._DeviceCapabilities, offset: 0 })
            DefineProp(this.Prototype, 'FilterResourceRequirements', { type: FLT_PARAMETERS._Pnp._FilterResourceRequirements, offset: 0 })
            DefineProp(this.Prototype, 'ReadWriteConfig', { type: FLT_PARAMETERS._Pnp._ReadWriteConfig, offset: 0 })
            DefineProp(this.Prototype, 'SetLock', { type: FLT_PARAMETERS._Pnp._SetLock, offset: 0 })
            DefineProp(this.Prototype, 'QueryId', { type: FLT_PARAMETERS._Pnp._QueryId, offset: 0 })
            DefineProp(this.Prototype, 'QueryDeviceText', { type: FLT_PARAMETERS._Pnp._QueryDeviceText, offset: 0 })
            DefineProp(this.Prototype, 'UsageNotification', { type: FLT_PARAMETERS._Pnp._UsageNotification, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _AcquireForSectionSynchronization {
        SyncType : FS_FILTER_SECTION_SYNC_TYPE

        PageProtection : UInt32

        OutputInformation : FS_FILTER_SECTION_SYNC_OUTPUT.Ptr

        Flags : UInt32

        AllocationAttributes : UInt32

    }

    struct _AcquireForModifiedPageWriter {
        EndingOffset : IntPtr

        ResourceToRelease : IntPtr

    }

    struct _ReleaseForModifiedPageWriter {
        ResourceToRelease : ERESOURCE.Ptr

    }

    struct _QueryOpen {
        Irp : IRP.Ptr

        FileInformation : IntPtr

        Length : IntPtr

        FileInformationClass : FILE_INFORMATION_CLASS

    }

    struct _FastIoCheckIfPossible {
        FileOffset : Int64

        Length : UInt32

        LockKey : UInt32

        CheckForReadOperation : BOOLEAN

    }

    struct _NetworkQueryOpen {
        Irp : IRP.Ptr

        NetworkInformation : FILE_NETWORK_OPEN_INFORMATION.Ptr

    }

    struct _MdlRead {
        FileOffset : Int64

        Length : UInt32

        Key : UInt32

        MdlChain : IntPtr

    }

    struct _MdlReadComplete {
        MdlChain : MDL.Ptr

    }

    struct _PrepareMdlWrite {
        FileOffset : Int64

        Length : UInt32

        Key : UInt32

        MdlChain : IntPtr

    }

    struct _MdlWriteComplete {
        FileOffset : Int64

        MdlChain : MDL.Ptr

    }

    struct _MountVolume {
        DeviceType : UInt32

    }

    struct _Others {
        Argument1 : IntPtr

        Argument2 : IntPtr

        Argument3 : IntPtr

        Argument4 : IntPtr

        Argument5 : IntPtr

        Argument6 : Int64

    }

    Create : FLT_PARAMETERS._Create

    static __New() {
        DefineProp(this.Prototype, 'CreatePipe', { type: FLT_PARAMETERS._CreatePipe, offset: 0 })
        DefineProp(this.Prototype, 'CreateMailslot', { type: FLT_PARAMETERS._CreateMailslot, offset: 0 })
        DefineProp(this.Prototype, 'Read', { type: FLT_PARAMETERS._Read, offset: 0 })
        DefineProp(this.Prototype, 'Write', { type: FLT_PARAMETERS._Write, offset: 0 })
        DefineProp(this.Prototype, 'QueryFileInformation', { type: FLT_PARAMETERS._QueryFileInformation, offset: 0 })
        DefineProp(this.Prototype, 'SetFileInformation', { type: FLT_PARAMETERS._SetFileInformation, offset: 0 })
        DefineProp(this.Prototype, 'QueryEa', { type: FLT_PARAMETERS._QueryEa, offset: 0 })
        DefineProp(this.Prototype, 'SetEa', { type: FLT_PARAMETERS._SetEa, offset: 0 })
        DefineProp(this.Prototype, 'QueryVolumeInformation', { type: FLT_PARAMETERS._QueryVolumeInformation, offset: 0 })
        DefineProp(this.Prototype, 'SetVolumeInformation', { type: FLT_PARAMETERS._SetVolumeInformation, offset: 0 })
        DefineProp(this.Prototype, 'DirectoryControl', { type: FLT_PARAMETERS._DirectoryControl, offset: 0 })
        DefineProp(this.Prototype, 'FileSystemControl', { type: FLT_PARAMETERS._FileSystemControl, offset: 0 })
        DefineProp(this.Prototype, 'DeviceIoControl', { type: FLT_PARAMETERS._DeviceIoControl, offset: 0 })
        DefineProp(this.Prototype, 'LockControl', { type: FLT_PARAMETERS._LockControl, offset: 0 })
        DefineProp(this.Prototype, 'QuerySecurity', { type: FLT_PARAMETERS._QuerySecurity, offset: 0 })
        DefineProp(this.Prototype, 'SetSecurity', { type: FLT_PARAMETERS._SetSecurity, offset: 0 })
        DefineProp(this.Prototype, 'WMI', { type: FLT_PARAMETERS._WMI, offset: 0 })
        DefineProp(this.Prototype, 'QueryQuota', { type: FLT_PARAMETERS._QueryQuota, offset: 0 })
        DefineProp(this.Prototype, 'SetQuota', { type: FLT_PARAMETERS._SetQuota, offset: 0 })
        DefineProp(this.Prototype, 'Pnp', { type: FLT_PARAMETERS._Pnp, offset: 0 })
        DefineProp(this.Prototype, 'AcquireForSectionSynchronization', { type: FLT_PARAMETERS._AcquireForSectionSynchronization, offset: 0 })
        DefineProp(this.Prototype, 'AcquireForModifiedPageWriter', { type: FLT_PARAMETERS._AcquireForModifiedPageWriter, offset: 0 })
        DefineProp(this.Prototype, 'ReleaseForModifiedPageWriter', { type: FLT_PARAMETERS._ReleaseForModifiedPageWriter, offset: 0 })
        DefineProp(this.Prototype, 'QueryOpen', { type: FLT_PARAMETERS._QueryOpen, offset: 0 })
        DefineProp(this.Prototype, 'FastIoCheckIfPossible', { type: FLT_PARAMETERS._FastIoCheckIfPossible, offset: 0 })
        DefineProp(this.Prototype, 'NetworkQueryOpen', { type: FLT_PARAMETERS._NetworkQueryOpen, offset: 0 })
        DefineProp(this.Prototype, 'MdlRead', { type: FLT_PARAMETERS._MdlRead, offset: 0 })
        DefineProp(this.Prototype, 'MdlReadComplete', { type: FLT_PARAMETERS._MdlReadComplete, offset: 0 })
        DefineProp(this.Prototype, 'PrepareMdlWrite', { type: FLT_PARAMETERS._PrepareMdlWrite, offset: 0 })
        DefineProp(this.Prototype, 'MdlWriteComplete', { type: FLT_PARAMETERS._MdlWriteComplete, offset: 0 })
        DefineProp(this.Prototype, 'MountVolume', { type: FLT_PARAMETERS._MountVolume, offset: 0 })
        DefineProp(this.Prototype, 'Others', { type: FLT_PARAMETERS._Others, offset: 0 })
        this.DeleteProp("__New")
    }
}
