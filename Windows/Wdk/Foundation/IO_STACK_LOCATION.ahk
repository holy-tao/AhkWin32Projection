#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\IO_SECURITY_CONTEXT.ahk
#Include ..\System\SystemServices\NAMED_PIPE_CREATE_PARAMETERS.ahk
#Include ..\System\SystemServices\MAILSLOT_CREATE_PARAMETERS.ahk
#Include ..\..\Win32\Foundation\UNICODE_STRING.ahk
#Include ..\Storage\FileSystem\FILE_INFORMATION_CLASS.ahk
#Include ..\System\SystemServices\DIRECTORY_NOTIFY_INFORMATION_CLASS.ahk
#Include .\FILE_OBJECT.ahk
#Include ..\..\Win32\Foundation\HANDLE.ahk
#Include ..\Storage\FileSystem\FS_INFORMATION_CLASS.ahk
#Include ..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk
#Include .\VPB.ahk
#Include .\DEVICE_OBJECT.ahk
#Include ..\Storage\FileSystem\FILE_GET_QUOTA_INFORMATION.ahk
#Include ..\System\SystemServices\DEVICE_RELATION_TYPE.ahk
#Include ..\System\SystemServices\INTERFACE.ahk
#Include ..\System\SystemServices\DEVICE_CAPABILITIES.ahk
#Include ..\System\SystemServices\IO_RESOURCE_REQUIREMENTS_LIST.ahk
#Include ..\System\SystemServices\BUS_QUERY_ID_TYPE.ahk
#Include ..\System\SystemServices\DEVICE_TEXT_TYPE.ahk
#Include ..\System\SystemServices\DEVICE_USAGE_NOTIFICATION_TYPE.ahk
#Include ..\..\Win32\System\Power\SYSTEM_POWER_STATE.ahk
#Include ..\System\SystemServices\POWER_SEQUENCE.ahk
#Include ..\System\SystemServices\POWER_STATE_TYPE.ahk
#Include ..\..\Win32\System\Power\POWER_ACTION.ahk
#Include ..\System\SystemServices\CM_RESOURCE_LIST.ahk

/**
 * @namespace Windows.Wdk.Foundation
 */
class IO_STACK_LOCATION extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    class _Parameters_e__Union extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        class _Create extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Pointer<IO_SECURITY_CONTEXT>}
             */
            SecurityContext {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Options {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            FileAttributes {
                get => NumGet(this, 12, "ushort")
                set => NumPut("ushort", value, this, 12)
            }

            /**
             * @type {Integer}
             */
            ShareAccess {
                get => NumGet(this, 14, "ushort")
                set => NumPut("ushort", value, this, 14)
            }

            /**
             * @type {Integer}
             */
            EaLength {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }
        }

        class _CreatePipe extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Pointer<IO_SECURITY_CONTEXT>}
             */
            SecurityContext {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Options {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            Reserved {
                get => NumGet(this, 12, "ushort")
                set => NumPut("ushort", value, this, 12)
            }

            /**
             * @type {Integer}
             */
            ShareAccess {
                get => NumGet(this, 14, "ushort")
                set => NumPut("ushort", value, this, 14)
            }

            /**
             * @type {Pointer<NAMED_PIPE_CREATE_PARAMETERS>}
             */
            Parameters {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        }

        class _CreateMailslot extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Pointer<IO_SECURITY_CONTEXT>}
             */
            SecurityContext {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Options {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            Reserved {
                get => NumGet(this, 12, "ushort")
                set => NumPut("ushort", value, this, 12)
            }

            /**
             * @type {Integer}
             */
            ShareAccess {
                get => NumGet(this, 14, "ushort")
                set => NumPut("ushort", value, this, 14)
            }

            /**
             * @type {Pointer<MAILSLOT_CREATE_PARAMETERS>}
             */
            Parameters {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        }

        class _Read extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Key {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            ByteOffset {
                get => NumGet(this, 8, "int64")
                set => NumPut("int64", value, this, 8)
            }
        }

        class _Write extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Key {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            ByteOffset {
                get => NumGet(this, 8, "int64")
                set => NumPut("int64", value, this, 8)
            }
        }

        class _QueryDirectory extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Pointer<UNICODE_STRING>}
             */
            FileName {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {FILE_INFORMATION_CLASS}
             */
            FileInformationClass {
                get => NumGet(this, 16, "int")
                set => NumPut("int", value, this, 16)
            }

            /**
             * @type {Integer}
             */
            FileIndex {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        }

        class _NotifyDirectory extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            CompletionFilter {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        }

        class _NotifyDirectoryEx extends Win32Struct {
            static sizeof => 12
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            CompletionFilter {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {DIRECTORY_NOTIFY_INFORMATION_CLASS}
             */
            DirectoryNotifyInformationClass {
                get => NumGet(this, 8, "int")
                set => NumPut("int", value, this, 8)
            }
        }

        class _QueryFile extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {FILE_INFORMATION_CLASS}
             */
            FileInformationClass {
                get => NumGet(this, 4, "int")
                set => NumPut("int", value, this, 4)
            }
        }

        class _SetFile extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {FILE_INFORMATION_CLASS}
             */
            FileInformationClass {
                get => NumGet(this, 4, "int")
                set => NumPut("int", value, this, 4)
            }

            /**
             * @type {Pointer<FILE_OBJECT>}
             */
            FileObject {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {BOOLEAN}
             */
            ReplaceIfExists {
                get => NumGet(this, 16, "char")
                set => NumPut("char", value, this, 16)
            }

            /**
             * @type {BOOLEAN}
             */
            AdvanceOnly {
                get => NumGet(this, 17, "char")
                set => NumPut("char", value, this, 17)
            }

            /**
             * @type {Integer}
             */
            ClusterCount {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }

            /**
             * @type {HANDLE}
             */
            DeleteHandle {
                get {
                    if(!this.HasProp("__DeleteHandle"))
                        this.__DeleteHandle := HANDLE(16, this)
                    return this.__DeleteHandle
                }
            }
        }

        class _QueryEa extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Pointer<Void>}
             */
            EaList {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            EaListLength {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }

            /**
             * @type {Integer}
             */
            EaIndex {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        }

        class _SetEa extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        class _QueryVolume extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {FS_INFORMATION_CLASS}
             */
            FsInformationClass {
                get => NumGet(this, 4, "int")
                set => NumPut("int", value, this, 4)
            }
        }

        class _SetVolume extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {FS_INFORMATION_CLASS}
             */
            FsInformationClass {
                get => NumGet(this, 4, "int")
                set => NumPut("int", value, this, 4)
            }
        }

        class _FileSystemControl extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            OutputBufferLength {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            InputBufferLength {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            FsControlCode {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }

            /**
             * @type {Pointer<Void>}
             */
            Type3InputBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        }

        class _LockControl extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Pointer<Integer>}
             */
            Length {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Key {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            ByteOffset {
                get => NumGet(this, 16, "int64")
                set => NumPut("int64", value, this, 16)
            }
        }

        class _DeviceIoControl extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            OutputBufferLength {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            InputBufferLength {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }

            /**
             * @type {Integer}
             */
            IoControlCode {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }

            /**
             * @type {Pointer<Void>}
             */
            Type3InputBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        }

        class _QuerySecurity extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {Integer}
             */
            SecurityInformation {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        }

        class _SetSecurity extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Integer}
             */
            SecurityInformation {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {PSECURITY_DESCRIPTOR}
             */
            SecurityDescriptor {
                get {
                    if(!this.HasProp("__SecurityDescriptor"))
                        this.__SecurityDescriptor := PSECURITY_DESCRIPTOR(8, this)
                    return this.__SecurityDescriptor
                }
            }
        }

        class _MountVolume extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Pointer<VPB>}
             */
            Vpb {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<DEVICE_OBJECT>}
             */
            DeviceObject {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        class _VerifyVolume extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Pointer<VPB>}
             */
            Vpb {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<DEVICE_OBJECT>}
             */
            DeviceObject {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        class _Scsi extends Win32Struct {
            static sizeof => 8
            static packingSize => 8

            /**
             * @type {Pointer<_SCSI_REQUEST_BLOCK>}
             */
            Srb {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        }

        class _QueryQuota extends Win32Struct {
            static sizeof => 32
            static packingSize => 8

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {PSID}
             */
            StartSid {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {Pointer<FILE_GET_QUOTA_INFORMATION>}
             */
            SidList {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }

            /**
             * @type {Integer}
             */
            SidListLength {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        }

        class _SetQuota extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }
        }

        class _QueryDeviceRelations extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {DEVICE_RELATION_TYPE}
             */
            Type {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        }

        class _QueryInterface extends Win32Struct {
            static sizeof => 32
            static packingSize => 8

            /**
             * @type {Pointer<Guid>}
             */
            InterfaceType {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            Size {
                get => NumGet(this, 8, "ushort")
                set => NumPut("ushort", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            Version {
                get => NumGet(this, 10, "ushort")
                set => NumPut("ushort", value, this, 10)
            }

            /**
             * @type {Pointer<INTERFACE>}
             */
            Interface {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }

            /**
             * @type {Pointer<Void>}
             */
            InterfaceSpecificData {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        }

        class _DeviceCapabilities extends Win32Struct {
            static sizeof => 8
            static packingSize => 8

            /**
             * @type {Pointer<DEVICE_CAPABILITIES>}
             */
            Capabilities {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        }

        class _FilterResourceRequirements extends Win32Struct {
            static sizeof => 8
            static packingSize => 8

            /**
             * @type {Pointer<IO_RESOURCE_REQUIREMENTS_LIST>}
             */
            IoResourceRequirementList {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        }

        class _ReadWriteConfig extends Win32Struct {
            static sizeof => 24
            static packingSize => 8

            /**
             * @type {Integer}
             */
            WhichSpace {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Pointer<Void>}
             */
            Buffer {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            Offset {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }

            /**
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 20, "uint")
                set => NumPut("uint", value, this, 20)
            }
        }

        class _SetLock extends Win32Struct {
            static sizeof => 1
            static packingSize => 1

            /**
             * @type {BOOLEAN}
             */
            Lock {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        }

        class _QueryId extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {BUS_QUERY_ID_TYPE}
             */
            IdType {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        }

        class _QueryDeviceText extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {DEVICE_TEXT_TYPE}
             */
            DeviceTextType {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }

            /**
             * @type {Integer}
             */
            LocaleId {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        }

        class _UsageNotification extends Win32Struct {
            static sizeof => 8
            static packingSize => 4

            /**
             * @type {BOOLEAN}
             */
            InPath {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }

            /**
             * @type {Array<BOOLEAN>}
             */
            Reserved {
                get {
                    if(!this.HasProp("__ReservedProxyArray"))
                        this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
                    return this.__ReservedProxyArray
                }
            }

            /**
             * @type {DEVICE_USAGE_NOTIFICATION_TYPE}
             */
            Type {
                get => NumGet(this, 4, "int")
                set => NumPut("int", value, this, 4)
            }
        }

        class _WaitWake extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * @type {SYSTEM_POWER_STATE}
             */
            PowerState {
                get => NumGet(this, 0, "int")
                set => NumPut("int", value, this, 0)
            }
        }

        class _PowerSequence extends Win32Struct {
            static sizeof => 8
            static packingSize => 8

            /**
             * @type {Pointer<POWER_SEQUENCE>}
             */
            PowerSequence {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        }

        class _Power extends Win32Struct {
            static sizeof => 32
            static packingSize => 8

            /**
             * @type {Integer}
             */
            SystemContext {
                get => NumGet(this, 0, "uint")
                set => NumPut("uint", value, this, 0)
            }

            /**
             * @type {Pointer}
             */
            SystemPowerStateContext {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {POWER_STATE_TYPE}
             */
            Type {
                get => NumGet(this, 8, "int")
                set => NumPut("int", value, this, 8)
            }

            /**
             * @type {Pointer}
             */
            State {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }

            /**
             * @type {POWER_ACTION}
             */
            ShutdownType {
                get => NumGet(this, 24, "int")
                set => NumPut("int", value, this, 24)
            }
        }

        class _StartDevice extends Win32Struct {
            static sizeof => 16
            static packingSize => 8

            /**
             * @type {Pointer<CM_RESOURCE_LIST>}
             */
            AllocatedResources {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<CM_RESOURCE_LIST>}
             */
            AllocatedResourcesTranslated {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }
        }

        class _WMI extends Win32Struct {
            static sizeof => 32
            static packingSize => 8

            /**
             * @type {Pointer}
             */
            ProviderId {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<Void>}
             */
            DataPath {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {Integer}
             */
            BufferSize {
                get => NumGet(this, 16, "uint")
                set => NumPut("uint", value, this, 16)
            }

            /**
             * @type {Pointer<Void>}
             */
            Buffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        }

        class _Others extends Win32Struct {
            static sizeof => 32
            static packingSize => 8

            /**
             * @type {Pointer<Void>}
             */
            Argument1 {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }

            /**
             * @type {Pointer<Void>}
             */
            Argument2 {
                get => NumGet(this, 8, "ptr")
                set => NumPut("ptr", value, this, 8)
            }

            /**
             * @type {Pointer<Void>}
             */
            Argument3 {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }

            /**
             * @type {Pointer<Void>}
             */
            Argument4 {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        }

        /**
         * @type {_Create}
         */
        Create {
            get {
                if(!this.HasProp("__Create"))
                    this.__Create := IO_STACK_LOCATION._Parameters_e__Union._Create(0, this)
                return this.__Create
            }
        }

        /**
         * @type {_CreatePipe}
         */
        CreatePipe {
            get {
                if(!this.HasProp("__CreatePipe"))
                    this.__CreatePipe := IO_STACK_LOCATION._Parameters_e__Union._CreatePipe(0, this)
                return this.__CreatePipe
            }
        }

        /**
         * @type {_CreateMailslot}
         */
        CreateMailslot {
            get {
                if(!this.HasProp("__CreateMailslot"))
                    this.__CreateMailslot := IO_STACK_LOCATION._Parameters_e__Union._CreateMailslot(0, this)
                return this.__CreateMailslot
            }
        }

        /**
         * @type {_Read}
         */
        Read {
            get {
                if(!this.HasProp("__Read"))
                    this.__Read := IO_STACK_LOCATION._Parameters_e__Union._Read(0, this)
                return this.__Read
            }
        }

        /**
         * @type {_Write}
         */
        Write {
            get {
                if(!this.HasProp("__Write"))
                    this.__Write := IO_STACK_LOCATION._Parameters_e__Union._Write(0, this)
                return this.__Write
            }
        }

        /**
         * @type {_QueryDirectory}
         */
        QueryDirectory {
            get {
                if(!this.HasProp("__QueryDirectory"))
                    this.__QueryDirectory := IO_STACK_LOCATION._Parameters_e__Union._QueryDirectory(0, this)
                return this.__QueryDirectory
            }
        }

        /**
         * @type {_NotifyDirectory}
         */
        NotifyDirectory {
            get {
                if(!this.HasProp("__NotifyDirectory"))
                    this.__NotifyDirectory := IO_STACK_LOCATION._Parameters_e__Union._NotifyDirectory(0, this)
                return this.__NotifyDirectory
            }
        }

        /**
         * @type {_NotifyDirectoryEx}
         */
        NotifyDirectoryEx {
            get {
                if(!this.HasProp("__NotifyDirectoryEx"))
                    this.__NotifyDirectoryEx := IO_STACK_LOCATION._Parameters_e__Union._NotifyDirectoryEx(0, this)
                return this.__NotifyDirectoryEx
            }
        }

        /**
         * @type {_QueryFile}
         */
        QueryFile {
            get {
                if(!this.HasProp("__QueryFile"))
                    this.__QueryFile := IO_STACK_LOCATION._Parameters_e__Union._QueryFile(0, this)
                return this.__QueryFile
            }
        }

        /**
         * @type {_SetFile}
         */
        SetFile {
            get {
                if(!this.HasProp("__SetFile"))
                    this.__SetFile := IO_STACK_LOCATION._Parameters_e__Union._SetFile(0, this)
                return this.__SetFile
            }
        }

        /**
         * @type {_QueryEa}
         */
        QueryEa {
            get {
                if(!this.HasProp("__QueryEa"))
                    this.__QueryEa := IO_STACK_LOCATION._Parameters_e__Union._QueryEa(0, this)
                return this.__QueryEa
            }
        }

        /**
         * @type {_SetEa}
         */
        SetEa {
            get {
                if(!this.HasProp("__SetEa"))
                    this.__SetEa := IO_STACK_LOCATION._Parameters_e__Union._SetEa(0, this)
                return this.__SetEa
            }
        }

        /**
         * @type {_QueryVolume}
         */
        QueryVolume {
            get {
                if(!this.HasProp("__QueryVolume"))
                    this.__QueryVolume := IO_STACK_LOCATION._Parameters_e__Union._QueryVolume(0, this)
                return this.__QueryVolume
            }
        }

        /**
         * @type {_SetVolume}
         */
        SetVolume {
            get {
                if(!this.HasProp("__SetVolume"))
                    this.__SetVolume := IO_STACK_LOCATION._Parameters_e__Union._SetVolume(0, this)
                return this.__SetVolume
            }
        }

        /**
         * @type {_FileSystemControl}
         */
        FileSystemControl {
            get {
                if(!this.HasProp("__FileSystemControl"))
                    this.__FileSystemControl := IO_STACK_LOCATION._Parameters_e__Union._FileSystemControl(0, this)
                return this.__FileSystemControl
            }
        }

        /**
         * @type {_LockControl}
         */
        LockControl {
            get {
                if(!this.HasProp("__LockControl"))
                    this.__LockControl := IO_STACK_LOCATION._Parameters_e__Union._LockControl(0, this)
                return this.__LockControl
            }
        }

        /**
         * @type {_DeviceIoControl}
         */
        DeviceIoControl {
            get {
                if(!this.HasProp("__DeviceIoControl"))
                    this.__DeviceIoControl := IO_STACK_LOCATION._Parameters_e__Union._DeviceIoControl(0, this)
                return this.__DeviceIoControl
            }
        }

        /**
         * @type {_QuerySecurity}
         */
        QuerySecurity {
            get {
                if(!this.HasProp("__QuerySecurity"))
                    this.__QuerySecurity := IO_STACK_LOCATION._Parameters_e__Union._QuerySecurity(0, this)
                return this.__QuerySecurity
            }
        }

        /**
         * @type {_SetSecurity}
         */
        SetSecurity {
            get {
                if(!this.HasProp("__SetSecurity"))
                    this.__SetSecurity := IO_STACK_LOCATION._Parameters_e__Union._SetSecurity(0, this)
                return this.__SetSecurity
            }
        }

        /**
         * @type {_MountVolume}
         */
        MountVolume {
            get {
                if(!this.HasProp("__MountVolume"))
                    this.__MountVolume := IO_STACK_LOCATION._Parameters_e__Union._MountVolume(0, this)
                return this.__MountVolume
            }
        }

        /**
         * @type {_VerifyVolume}
         */
        VerifyVolume {
            get {
                if(!this.HasProp("__VerifyVolume"))
                    this.__VerifyVolume := IO_STACK_LOCATION._Parameters_e__Union._VerifyVolume(0, this)
                return this.__VerifyVolume
            }
        }

        /**
         * @type {_Scsi}
         */
        Scsi {
            get {
                if(!this.HasProp("__Scsi"))
                    this.__Scsi := IO_STACK_LOCATION._Parameters_e__Union._Scsi(0, this)
                return this.__Scsi
            }
        }

        /**
         * @type {_QueryQuota}
         */
        QueryQuota {
            get {
                if(!this.HasProp("__QueryQuota"))
                    this.__QueryQuota := IO_STACK_LOCATION._Parameters_e__Union._QueryQuota(0, this)
                return this.__QueryQuota
            }
        }

        /**
         * @type {_SetQuota}
         */
        SetQuota {
            get {
                if(!this.HasProp("__SetQuota"))
                    this.__SetQuota := IO_STACK_LOCATION._Parameters_e__Union._SetQuota(0, this)
                return this.__SetQuota
            }
        }

        /**
         * @type {_QueryDeviceRelations}
         */
        QueryDeviceRelations {
            get {
                if(!this.HasProp("__QueryDeviceRelations"))
                    this.__QueryDeviceRelations := IO_STACK_LOCATION._Parameters_e__Union._QueryDeviceRelations(0, this)
                return this.__QueryDeviceRelations
            }
        }

        /**
         * @type {_QueryInterface}
         */
        QueryInterface {
            get {
                if(!this.HasProp("__QueryInterface"))
                    this.__QueryInterface := IO_STACK_LOCATION._Parameters_e__Union._QueryInterface(0, this)
                return this.__QueryInterface
            }
        }

        /**
         * @type {_DeviceCapabilities}
         */
        DeviceCapabilities {
            get {
                if(!this.HasProp("__DeviceCapabilities"))
                    this.__DeviceCapabilities := IO_STACK_LOCATION._Parameters_e__Union._DeviceCapabilities(0, this)
                return this.__DeviceCapabilities
            }
        }

        /**
         * @type {_FilterResourceRequirements}
         */
        FilterResourceRequirements {
            get {
                if(!this.HasProp("__FilterResourceRequirements"))
                    this.__FilterResourceRequirements := IO_STACK_LOCATION._Parameters_e__Union._FilterResourceRequirements(0, this)
                return this.__FilterResourceRequirements
            }
        }

        /**
         * @type {_ReadWriteConfig}
         */
        ReadWriteConfig {
            get {
                if(!this.HasProp("__ReadWriteConfig"))
                    this.__ReadWriteConfig := IO_STACK_LOCATION._Parameters_e__Union._ReadWriteConfig(0, this)
                return this.__ReadWriteConfig
            }
        }

        /**
         * @type {_SetLock}
         */
        SetLock {
            get {
                if(!this.HasProp("__SetLock"))
                    this.__SetLock := IO_STACK_LOCATION._Parameters_e__Union._SetLock(0, this)
                return this.__SetLock
            }
        }

        /**
         * @type {_QueryId}
         */
        QueryId {
            get {
                if(!this.HasProp("__QueryId"))
                    this.__QueryId := IO_STACK_LOCATION._Parameters_e__Union._QueryId(0, this)
                return this.__QueryId
            }
        }

        /**
         * @type {_QueryDeviceText}
         */
        QueryDeviceText {
            get {
                if(!this.HasProp("__QueryDeviceText"))
                    this.__QueryDeviceText := IO_STACK_LOCATION._Parameters_e__Union._QueryDeviceText(0, this)
                return this.__QueryDeviceText
            }
        }

        /**
         * @type {_UsageNotification}
         */
        UsageNotification {
            get {
                if(!this.HasProp("__UsageNotification"))
                    this.__UsageNotification := IO_STACK_LOCATION._Parameters_e__Union._UsageNotification(0, this)
                return this.__UsageNotification
            }
        }

        /**
         * @type {_WaitWake}
         */
        WaitWake {
            get {
                if(!this.HasProp("__WaitWake"))
                    this.__WaitWake := IO_STACK_LOCATION._Parameters_e__Union._WaitWake(0, this)
                return this.__WaitWake
            }
        }

        /**
         * @type {_PowerSequence}
         */
        PowerSequence {
            get {
                if(!this.HasProp("__PowerSequence"))
                    this.__PowerSequence := IO_STACK_LOCATION._Parameters_e__Union._PowerSequence(0, this)
                return this.__PowerSequence
            }
        }

        /**
         * @type {_Power}
         */
        Power {
            get {
                if(!this.HasProp("__Power"))
                    this.__Power := IO_STACK_LOCATION._Parameters_e__Union._Power(0, this)
                return this.__Power
            }
        }

        /**
         * @type {_StartDevice}
         */
        StartDevice {
            get {
                if(!this.HasProp("__StartDevice"))
                    this.__StartDevice := IO_STACK_LOCATION._Parameters_e__Union._StartDevice(0, this)
                return this.__StartDevice
            }
        }

        /**
         * @type {_WMI}
         */
        WMI {
            get {
                if(!this.HasProp("__WMI"))
                    this.__WMI := IO_STACK_LOCATION._Parameters_e__Union._WMI(0, this)
                return this.__WMI
            }
        }

        /**
         * @type {_Others}
         */
        Others {
            get {
                if(!this.HasProp("__Others"))
                    this.__Others := IO_STACK_LOCATION._Parameters_e__Union._Others(0, this)
                return this.__Others
            }
        }
    }

    /**
     * @type {Integer}
     */
    MajorFunction {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MinorFunction {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Control {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {_Parameters_e__Union}
     */
    Parameters {
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := IO_STACK_LOCATION._Parameters_e__Union(8, this)
            return this.__Parameters
        }
    }

    /**
     * @type {Pointer<DEVICE_OBJECT>}
     */
    DeviceObject {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<FILE_OBJECT>}
     */
    FileObject {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PIO_COMPLETION_ROUTINE>}
     */
    CompletionRoutine {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Void>}
     */
    Context {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
