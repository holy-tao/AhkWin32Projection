#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\HANDLE.ahk
#Include ..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class IO_STACK_LOCATION extends Win32Struct
{
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
             * @type {Integer}
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
             * @type {Integer}
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
             * @type {Integer}
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
             * @type {Integer}
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
            DeleteHandle{
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
             * @type {Integer}
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
             * @type {Integer}
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
            SecurityDescriptor{
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
             * @type {Integer}
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
             * @type {Integer}
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
             * @type {Integer}
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
            Reserved{
                get {
                    if(!this.HasProp("__ReservedProxyArray"))
                        this.__ReservedProxyArray := Win32FixedArray(this.ptr + 1, 3, Primitive, "char")
                    return this.__ReservedProxyArray
                }
            }
        
            /**
             * @type {Integer}
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
             * @type {Integer}
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
             * @type {Pointer<SYSTEM_POWER_STATE_CONTEXT>}
             */
            SystemPowerStateContext {
                get => NumGet(this, 0, "ptr")
                set => NumPut("ptr", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            Type {
                get => NumGet(this, 8, "int")
                set => NumPut("int", value, this, 8)
            }
        
            /**
             * @type {Pointer<POWER_STATE>}
             */
            State {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Integer}
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
        Create{
            get {
                if(!this.HasProp("__Create"))
                    this.__Create := %this.__Class%._Create(0, this)
                return this.__Create
            }
        }
    
        /**
         * @type {_CreatePipe}
         */
        CreatePipe{
            get {
                if(!this.HasProp("__CreatePipe"))
                    this.__CreatePipe := %this.__Class%._CreatePipe(0, this)
                return this.__CreatePipe
            }
        }
    
        /**
         * @type {_CreateMailslot}
         */
        CreateMailslot{
            get {
                if(!this.HasProp("__CreateMailslot"))
                    this.__CreateMailslot := %this.__Class%._CreateMailslot(0, this)
                return this.__CreateMailslot
            }
        }
    
        /**
         * @type {_Read}
         */
        Read{
            get {
                if(!this.HasProp("__Read"))
                    this.__Read := %this.__Class%._Read(0, this)
                return this.__Read
            }
        }
    
        /**
         * @type {_Write}
         */
        Write{
            get {
                if(!this.HasProp("__Write"))
                    this.__Write := %this.__Class%._Write(0, this)
                return this.__Write
            }
        }
    
        /**
         * @type {_QueryDirectory}
         */
        QueryDirectory{
            get {
                if(!this.HasProp("__QueryDirectory"))
                    this.__QueryDirectory := %this.__Class%._QueryDirectory(0, this)
                return this.__QueryDirectory
            }
        }
    
        /**
         * @type {_NotifyDirectory}
         */
        NotifyDirectory{
            get {
                if(!this.HasProp("__NotifyDirectory"))
                    this.__NotifyDirectory := %this.__Class%._NotifyDirectory(0, this)
                return this.__NotifyDirectory
            }
        }
    
        /**
         * @type {_NotifyDirectoryEx}
         */
        NotifyDirectoryEx{
            get {
                if(!this.HasProp("__NotifyDirectoryEx"))
                    this.__NotifyDirectoryEx := %this.__Class%._NotifyDirectoryEx(0, this)
                return this.__NotifyDirectoryEx
            }
        }
    
        /**
         * @type {_QueryFile}
         */
        QueryFile{
            get {
                if(!this.HasProp("__QueryFile"))
                    this.__QueryFile := %this.__Class%._QueryFile(0, this)
                return this.__QueryFile
            }
        }
    
        /**
         * @type {_SetFile}
         */
        SetFile{
            get {
                if(!this.HasProp("__SetFile"))
                    this.__SetFile := %this.__Class%._SetFile(0, this)
                return this.__SetFile
            }
        }
    
        /**
         * @type {_QueryEa}
         */
        QueryEa{
            get {
                if(!this.HasProp("__QueryEa"))
                    this.__QueryEa := %this.__Class%._QueryEa(0, this)
                return this.__QueryEa
            }
        }
    
        /**
         * @type {_SetEa}
         */
        SetEa{
            get {
                if(!this.HasProp("__SetEa"))
                    this.__SetEa := %this.__Class%._SetEa(0, this)
                return this.__SetEa
            }
        }
    
        /**
         * @type {_QueryVolume}
         */
        QueryVolume{
            get {
                if(!this.HasProp("__QueryVolume"))
                    this.__QueryVolume := %this.__Class%._QueryVolume(0, this)
                return this.__QueryVolume
            }
        }
    
        /**
         * @type {_SetVolume}
         */
        SetVolume{
            get {
                if(!this.HasProp("__SetVolume"))
                    this.__SetVolume := %this.__Class%._SetVolume(0, this)
                return this.__SetVolume
            }
        }
    
        /**
         * @type {_FileSystemControl}
         */
        FileSystemControl{
            get {
                if(!this.HasProp("__FileSystemControl"))
                    this.__FileSystemControl := %this.__Class%._FileSystemControl(0, this)
                return this.__FileSystemControl
            }
        }
    
        /**
         * @type {_LockControl}
         */
        LockControl{
            get {
                if(!this.HasProp("__LockControl"))
                    this.__LockControl := %this.__Class%._LockControl(0, this)
                return this.__LockControl
            }
        }
    
        /**
         * @type {_DeviceIoControl}
         */
        DeviceIoControl{
            get {
                if(!this.HasProp("__DeviceIoControl"))
                    this.__DeviceIoControl := %this.__Class%._DeviceIoControl(0, this)
                return this.__DeviceIoControl
            }
        }
    
        /**
         * @type {_QuerySecurity}
         */
        QuerySecurity{
            get {
                if(!this.HasProp("__QuerySecurity"))
                    this.__QuerySecurity := %this.__Class%._QuerySecurity(0, this)
                return this.__QuerySecurity
            }
        }
    
        /**
         * @type {_SetSecurity}
         */
        SetSecurity{
            get {
                if(!this.HasProp("__SetSecurity"))
                    this.__SetSecurity := %this.__Class%._SetSecurity(0, this)
                return this.__SetSecurity
            }
        }
    
        /**
         * @type {_MountVolume}
         */
        MountVolume{
            get {
                if(!this.HasProp("__MountVolume"))
                    this.__MountVolume := %this.__Class%._MountVolume(0, this)
                return this.__MountVolume
            }
        }
    
        /**
         * @type {_VerifyVolume}
         */
        VerifyVolume{
            get {
                if(!this.HasProp("__VerifyVolume"))
                    this.__VerifyVolume := %this.__Class%._VerifyVolume(0, this)
                return this.__VerifyVolume
            }
        }
    
        /**
         * @type {_Scsi}
         */
        Scsi{
            get {
                if(!this.HasProp("__Scsi"))
                    this.__Scsi := %this.__Class%._Scsi(0, this)
                return this.__Scsi
            }
        }
    
        /**
         * @type {_QueryQuota}
         */
        QueryQuota{
            get {
                if(!this.HasProp("__QueryQuota"))
                    this.__QueryQuota := %this.__Class%._QueryQuota(0, this)
                return this.__QueryQuota
            }
        }
    
        /**
         * @type {_SetQuota}
         */
        SetQuota{
            get {
                if(!this.HasProp("__SetQuota"))
                    this.__SetQuota := %this.__Class%._SetQuota(0, this)
                return this.__SetQuota
            }
        }
    
        /**
         * @type {_QueryDeviceRelations}
         */
        QueryDeviceRelations{
            get {
                if(!this.HasProp("__QueryDeviceRelations"))
                    this.__QueryDeviceRelations := %this.__Class%._QueryDeviceRelations(0, this)
                return this.__QueryDeviceRelations
            }
        }
    
        /**
         * @type {_QueryInterface}
         */
        QueryInterface{
            get {
                if(!this.HasProp("__QueryInterface"))
                    this.__QueryInterface := %this.__Class%._QueryInterface(0, this)
                return this.__QueryInterface
            }
        }
    
        /**
         * @type {_DeviceCapabilities}
         */
        DeviceCapabilities{
            get {
                if(!this.HasProp("__DeviceCapabilities"))
                    this.__DeviceCapabilities := %this.__Class%._DeviceCapabilities(0, this)
                return this.__DeviceCapabilities
            }
        }
    
        /**
         * @type {_FilterResourceRequirements}
         */
        FilterResourceRequirements{
            get {
                if(!this.HasProp("__FilterResourceRequirements"))
                    this.__FilterResourceRequirements := %this.__Class%._FilterResourceRequirements(0, this)
                return this.__FilterResourceRequirements
            }
        }
    
        /**
         * @type {_ReadWriteConfig}
         */
        ReadWriteConfig{
            get {
                if(!this.HasProp("__ReadWriteConfig"))
                    this.__ReadWriteConfig := %this.__Class%._ReadWriteConfig(0, this)
                return this.__ReadWriteConfig
            }
        }
    
        /**
         * @type {_SetLock}
         */
        SetLock{
            get {
                if(!this.HasProp("__SetLock"))
                    this.__SetLock := %this.__Class%._SetLock(0, this)
                return this.__SetLock
            }
        }
    
        /**
         * @type {_QueryId}
         */
        QueryId{
            get {
                if(!this.HasProp("__QueryId"))
                    this.__QueryId := %this.__Class%._QueryId(0, this)
                return this.__QueryId
            }
        }
    
        /**
         * @type {_QueryDeviceText}
         */
        QueryDeviceText{
            get {
                if(!this.HasProp("__QueryDeviceText"))
                    this.__QueryDeviceText := %this.__Class%._QueryDeviceText(0, this)
                return this.__QueryDeviceText
            }
        }
    
        /**
         * @type {_UsageNotification}
         */
        UsageNotification{
            get {
                if(!this.HasProp("__UsageNotification"))
                    this.__UsageNotification := %this.__Class%._UsageNotification(0, this)
                return this.__UsageNotification
            }
        }
    
        /**
         * @type {_WaitWake}
         */
        WaitWake{
            get {
                if(!this.HasProp("__WaitWake"))
                    this.__WaitWake := %this.__Class%._WaitWake(0, this)
                return this.__WaitWake
            }
        }
    
        /**
         * @type {_PowerSequence}
         */
        PowerSequence{
            get {
                if(!this.HasProp("__PowerSequence"))
                    this.__PowerSequence := %this.__Class%._PowerSequence(0, this)
                return this.__PowerSequence
            }
        }
    
        /**
         * @type {_Power}
         */
        Power{
            get {
                if(!this.HasProp("__Power"))
                    this.__Power := %this.__Class%._Power(0, this)
                return this.__Power
            }
        }
    
        /**
         * @type {_StartDevice}
         */
        StartDevice{
            get {
                if(!this.HasProp("__StartDevice"))
                    this.__StartDevice := %this.__Class%._StartDevice(0, this)
                return this.__StartDevice
            }
        }
    
        /**
         * @type {_WMI}
         */
        WMI{
            get {
                if(!this.HasProp("__WMI"))
                    this.__WMI := %this.__Class%._WMI(0, this)
                return this.__WMI
            }
        }
    
        /**
         * @type {_Others}
         */
        Others{
            get {
                if(!this.HasProp("__Others"))
                    this.__Others := %this.__Class%._Others(0, this)
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
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := %this.__Class%._Parameters_e__Union(8, this)
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
