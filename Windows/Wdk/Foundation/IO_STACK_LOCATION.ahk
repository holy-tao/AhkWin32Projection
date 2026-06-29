#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_SCSI_REQUEST_BLOCK.ahk" { _SCSI_REQUEST_BLOCK }
#Import "..\System\SystemServices\NAMED_PIPE_CREATE_PARAMETERS.ahk" { NAMED_PIPE_CREATE_PARAMETERS }
#Import "..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\System\SystemServices\CM_RESOURCE_LIST.ahk" { CM_RESOURCE_LIST }
#Import "..\System\SystemServices\POWER_SEQUENCE.ahk" { POWER_SEQUENCE }
#Import "..\System\SystemServices\DEVICE_USAGE_NOTIFICATION_TYPE.ahk" { DEVICE_USAGE_NOTIFICATION_TYPE }
#Import "..\System\SystemServices\BUS_QUERY_ID_TYPE.ahk" { BUS_QUERY_ID_TYPE }
#Import "..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\System\SystemServices\DEVICE_TEXT_TYPE.ahk" { DEVICE_TEXT_TYPE }
#Import "..\Storage\FileSystem\FS_INFORMATION_CLASS.ahk" { FS_INFORMATION_CLASS }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\IO_SECURITY_CONTEXT.ahk" { IO_SECURITY_CONTEXT }
#Import "..\System\SystemServices\DIRECTORY_NOTIFY_INFORMATION_CLASS.ahk" { DIRECTORY_NOTIFY_INFORMATION_CLASS }
#Import ".\VPB.ahk" { VPB }
#Import "..\System\SystemServices\IO_RESOURCE_REQUIREMENTS_LIST.ahk" { IO_RESOURCE_REQUIREMENTS_LIST }
#Import "..\..\Win32\Security\PSID.ahk" { PSID }
#Import "..\..\Win32\System\Power\POWER_ACTION.ahk" { POWER_ACTION }
#Import "..\System\SystemServices\DEVICE_CAPABILITIES.ahk" { DEVICE_CAPABILITIES }
#Import "..\System\SystemServices\DEVICE_RELATION_TYPE.ahk" { DEVICE_RELATION_TYPE }
#Import "..\Storage\FileSystem\FILE_GET_QUOTA_INFORMATION.ahk" { FILE_GET_QUOTA_INFORMATION }
#Import "..\System\SystemServices\MAILSLOT_CREATE_PARAMETERS.ahk" { MAILSLOT_CREATE_PARAMETERS }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\Storage\FileSystem\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\System\SystemServices\POWER_STATE_TYPE.ahk" { POWER_STATE_TYPE }
#Import "..\System\SystemServices\INTERFACE.ahk" { INTERFACE }
#Import "..\..\Win32\System\Power\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct IO_STACK_LOCATION {
    #StructPack 8


    struct _Parameters {

        struct _Create {
            SecurityContext : IO_SECURITY_CONTEXT.Ptr

            Options : UInt32

            FileAttributes : UInt16

            ShareAccess : UInt16

            EaLength : UInt32

        }

        struct _CreatePipe {
            SecurityContext : IO_SECURITY_CONTEXT.Ptr

            Options : UInt32

            Reserved : UInt16

            ShareAccess : UInt16

            Parameters : NAMED_PIPE_CREATE_PARAMETERS.Ptr

        }

        struct _CreateMailslot {
            SecurityContext : IO_SECURITY_CONTEXT.Ptr

            Options : UInt32

            Reserved : UInt16

            ShareAccess : UInt16

            Parameters : MAILSLOT_CREATE_PARAMETERS.Ptr

        }

        struct _Read {
            Length : UInt32

            Key : UInt32

            ByteOffset : Int64

        }

        struct _Write {
            Length : UInt32

            Key : UInt32

            ByteOffset : Int64

        }

        struct _QueryDirectory {
            Length : UInt32

            FileName : UNICODE_STRING.Ptr

            FileInformationClass : FILE_INFORMATION_CLASS

            FileIndex : UInt32

        }

        struct _NotifyDirectory {
            Length : UInt32

            CompletionFilter : UInt32

        }

        struct _NotifyDirectoryEx {
            Length : UInt32

            CompletionFilter : UInt32

            DirectoryNotifyInformationClass : DIRECTORY_NOTIFY_INFORMATION_CLASS

        }

        struct _QueryFile {
            Length : UInt32

            FileInformationClass : FILE_INFORMATION_CLASS

        }

        struct _SetFile {
            Length : UInt32

            FileInformationClass : FILE_INFORMATION_CLASS

            __FileObject_ptr : IntPtr
            FileObject {
                get => (addr := this.__FileObject_ptr) ? FILE_OBJECT.At(addr) : unset
                set => this.__FileObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

            ReplaceIfExists : BOOLEAN

            AdvanceOnly : BOOLEAN

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

        }

        struct _SetEa {
            Length : UInt32

        }

        struct _QueryVolume {
            Length : UInt32

            FsInformationClass : FS_INFORMATION_CLASS

        }

        struct _SetVolume {
            Length : UInt32

            FsInformationClass : FS_INFORMATION_CLASS

        }

        struct _FileSystemControl {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            FsControlCode : UInt32

            Type3InputBuffer : IntPtr

        }

        struct _LockControl {
            Length : IntPtr

            Key : UInt32

            ByteOffset : Int64

        }

        struct _DeviceIoControl {
            OutputBufferLength : UInt32

            InputBufferLength : UInt32

            IoControlCode : UInt32

            Type3InputBuffer : IntPtr

        }

        struct _QuerySecurity {
            SecurityInformation : UInt32

            Length : UInt32

        }

        struct _SetSecurity {
            SecurityInformation : UInt32

            SecurityDescriptor : PSECURITY_DESCRIPTOR

        }

        struct _MountVolume {
            __Vpb_ptr : IntPtr
            Vpb {
                get => (addr := this.__Vpb_ptr) ? VPB.At(addr) : unset
                set => this.__Vpb_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

            __DeviceObject_ptr : IntPtr
            DeviceObject {
                get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
                set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

        }

        struct _VerifyVolume {
            __Vpb_ptr : IntPtr
            Vpb {
                get => (addr := this.__Vpb_ptr) ? VPB.At(addr) : unset
                set => this.__Vpb_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

            __DeviceObject_ptr : IntPtr
            DeviceObject {
                get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
                set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
            }

        }

        struct _Scsi {
            Srb : _SCSI_REQUEST_BLOCK.Ptr

        }

        struct _QueryQuota {
            Length : UInt32

            StartSid : PSID

            SidList : FILE_GET_QUOTA_INFORMATION.Ptr

            SidListLength : UInt32

        }

        struct _SetQuota {
            Length : UInt32

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

        struct _WaitWake {
            PowerState : SYSTEM_POWER_STATE

        }

        struct _PowerSequence {
            PowerSequence : POWER_SEQUENCE.Ptr

        }

        struct _Power {
            SystemContext : UInt32

            Type : POWER_STATE_TYPE

            State : IntPtr

            ShutdownType : POWER_ACTION

            static __New() {
                DefineProp(this.Prototype, 'SystemPowerStateContext', { type: IntPtr, offset: 0 })
                this.DeleteProp("__New")
            }
        }

        struct _StartDevice {
            AllocatedResources : CM_RESOURCE_LIST.Ptr

            AllocatedResourcesTranslated : CM_RESOURCE_LIST.Ptr

        }

        struct _WMI {
            ProviderId : IntPtr

            DataPath : IntPtr

            BufferSize : UInt32

            Buffer : IntPtr

        }

        struct _Others {
            Argument1 : IntPtr

            Argument2 : IntPtr

            Argument3 : IntPtr

            Argument4 : IntPtr

        }

        Create : IO_STACK_LOCATION._Parameters._Create

        static __New() {
            DefineProp(this.Prototype, 'CreatePipe', { type: IO_STACK_LOCATION._Parameters._CreatePipe, offset: 0 })
            DefineProp(this.Prototype, 'CreateMailslot', { type: IO_STACK_LOCATION._Parameters._CreateMailslot, offset: 0 })
            DefineProp(this.Prototype, 'Read', { type: IO_STACK_LOCATION._Parameters._Read, offset: 0 })
            DefineProp(this.Prototype, 'Write', { type: IO_STACK_LOCATION._Parameters._Write, offset: 0 })
            DefineProp(this.Prototype, 'QueryDirectory', { type: IO_STACK_LOCATION._Parameters._QueryDirectory, offset: 0 })
            DefineProp(this.Prototype, 'NotifyDirectory', { type: IO_STACK_LOCATION._Parameters._NotifyDirectory, offset: 0 })
            DefineProp(this.Prototype, 'NotifyDirectoryEx', { type: IO_STACK_LOCATION._Parameters._NotifyDirectoryEx, offset: 0 })
            DefineProp(this.Prototype, 'QueryFile', { type: IO_STACK_LOCATION._Parameters._QueryFile, offset: 0 })
            DefineProp(this.Prototype, 'SetFile', { type: IO_STACK_LOCATION._Parameters._SetFile, offset: 0 })
            DefineProp(this.Prototype, 'QueryEa', { type: IO_STACK_LOCATION._Parameters._QueryEa, offset: 0 })
            DefineProp(this.Prototype, 'SetEa', { type: IO_STACK_LOCATION._Parameters._SetEa, offset: 0 })
            DefineProp(this.Prototype, 'QueryVolume', { type: IO_STACK_LOCATION._Parameters._QueryVolume, offset: 0 })
            DefineProp(this.Prototype, 'SetVolume', { type: IO_STACK_LOCATION._Parameters._SetVolume, offset: 0 })
            DefineProp(this.Prototype, 'FileSystemControl', { type: IO_STACK_LOCATION._Parameters._FileSystemControl, offset: 0 })
            DefineProp(this.Prototype, 'LockControl', { type: IO_STACK_LOCATION._Parameters._LockControl, offset: 0 })
            DefineProp(this.Prototype, 'DeviceIoControl', { type: IO_STACK_LOCATION._Parameters._DeviceIoControl, offset: 0 })
            DefineProp(this.Prototype, 'QuerySecurity', { type: IO_STACK_LOCATION._Parameters._QuerySecurity, offset: 0 })
            DefineProp(this.Prototype, 'SetSecurity', { type: IO_STACK_LOCATION._Parameters._SetSecurity, offset: 0 })
            DefineProp(this.Prototype, 'MountVolume', { type: IO_STACK_LOCATION._Parameters._MountVolume, offset: 0 })
            DefineProp(this.Prototype, 'VerifyVolume', { type: IO_STACK_LOCATION._Parameters._VerifyVolume, offset: 0 })
            DefineProp(this.Prototype, 'Scsi', { type: IO_STACK_LOCATION._Parameters._Scsi, offset: 0 })
            DefineProp(this.Prototype, 'QueryQuota', { type: IO_STACK_LOCATION._Parameters._QueryQuota, offset: 0 })
            DefineProp(this.Prototype, 'SetQuota', { type: IO_STACK_LOCATION._Parameters._SetQuota, offset: 0 })
            DefineProp(this.Prototype, 'QueryDeviceRelations', { type: IO_STACK_LOCATION._Parameters._QueryDeviceRelations, offset: 0 })
            DefineProp(this.Prototype, 'QueryInterface', { type: IO_STACK_LOCATION._Parameters._QueryInterface, offset: 0 })
            DefineProp(this.Prototype, 'DeviceCapabilities', { type: IO_STACK_LOCATION._Parameters._DeviceCapabilities, offset: 0 })
            DefineProp(this.Prototype, 'FilterResourceRequirements', { type: IO_STACK_LOCATION._Parameters._FilterResourceRequirements, offset: 0 })
            DefineProp(this.Prototype, 'ReadWriteConfig', { type: IO_STACK_LOCATION._Parameters._ReadWriteConfig, offset: 0 })
            DefineProp(this.Prototype, 'SetLock', { type: IO_STACK_LOCATION._Parameters._SetLock, offset: 0 })
            DefineProp(this.Prototype, 'QueryId', { type: IO_STACK_LOCATION._Parameters._QueryId, offset: 0 })
            DefineProp(this.Prototype, 'QueryDeviceText', { type: IO_STACK_LOCATION._Parameters._QueryDeviceText, offset: 0 })
            DefineProp(this.Prototype, 'UsageNotification', { type: IO_STACK_LOCATION._Parameters._UsageNotification, offset: 0 })
            DefineProp(this.Prototype, 'WaitWake', { type: IO_STACK_LOCATION._Parameters._WaitWake, offset: 0 })
            DefineProp(this.Prototype, 'PowerSequence', { type: IO_STACK_LOCATION._Parameters._PowerSequence, offset: 0 })
            DefineProp(this.Prototype, 'Power', { type: IO_STACK_LOCATION._Parameters._Power, offset: 0 })
            DefineProp(this.Prototype, 'StartDevice', { type: IO_STACK_LOCATION._Parameters._StartDevice, offset: 0 })
            DefineProp(this.Prototype, 'WMI', { type: IO_STACK_LOCATION._Parameters._WMI, offset: 0 })
            DefineProp(this.Prototype, 'Others', { type: IO_STACK_LOCATION._Parameters._Others, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    MajorFunction : Int8

    MinorFunction : Int8

    Flags : Int8

    Control : Int8

    Parameters : IO_STACK_LOCATION._Parameters

    __DeviceObject_ptr : IntPtr
    DeviceObject {
        get => (addr := this.__DeviceObject_ptr) ? DEVICE_OBJECT.At(addr) : unset
        set => this.__DeviceObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __FileObject_ptr : IntPtr
    FileObject {
        get => (addr := this.__FileObject_ptr) ? FILE_OBJECT.At(addr) : unset
        set => this.__FileObject_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    CompletionRoutine : IntPtr

    Context : IntPtr

}
