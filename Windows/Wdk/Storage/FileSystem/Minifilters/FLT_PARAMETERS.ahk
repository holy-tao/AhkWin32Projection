#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Win32\Foundation\HANDLE.ahk
#Include ..\..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class FLT_PARAMETERS extends Win32Struct
{
    static sizeof => 880

    static packingSize => 8

    class _Create extends Win32Struct {
        static sizeof => 40
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
    
        /**
         * @type {Pointer<Void>}
         */
        EaBuffer {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        AllocationSize {
            get => NumGet(this, 32, "int64")
            set => NumPut("int64", value, this, 32)
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
         * @type {Pointer<Void>}
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
         * @type {Pointer<Void>}
         */
        Parameters {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _Read extends Win32Struct {
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
    
        /**
         * @type {Pointer<Void>}
         */
        ReadBuffer {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
    }

    class _Write extends Win32Struct {
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
    
        /**
         * @type {Pointer<Void>}
         */
        WriteBuffer {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
    }

    class _QueryFileInformation extends Win32Struct {
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
        FileInformationClass {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        InfoBuffer {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _SetFileInformation extends Win32Struct {
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
         * @type {Integer}
         */
        FileInformationClass {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<FILE_OBJECT>}
         */
        ParentOfTarget {
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
    
        /**
         * @type {Pointer<Void>}
         */
        InfoBuffer {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
    }

    class _QueryEa extends Win32Struct {
        static sizeof => 40
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
    
        /**
         * @type {Pointer<Void>}
         */
        EaBuffer {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    class _SetEa extends Win32Struct {
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
        EaBuffer {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _QueryVolumeInformation extends Win32Struct {
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
        FsInformationClass {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        VolumeBuffer {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _SetVolumeInformation extends Win32Struct {
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
        FsInformationClass {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        VolumeBuffer {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _DirectoryControl_e__Union extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        class _QueryDirectory extends Win32Struct {
            static sizeof => 40
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
        
            /**
             * @type {Pointer<Void>}
             */
            DirectoryBuffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            MdlAddress {
                get => NumGet(this, 32, "ptr")
                set => NumPut("ptr", value, this, 32)
            }
        
        }
    
        class _NotifyDirectory extends Win32Struct {
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
             * @type {Integer}
             */
            CompletionFilter {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Integer}
             */
            Spare1 {
                get => NumGet(this, 8, "uint")
                set => NumPut("uint", value, this, 8)
            }
        
            /**
             * @type {Integer}
             */
            Spare2 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            DirectoryBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            MdlAddress {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
        }
    
        class _NotifyDirectoryEx extends Win32Struct {
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
        
            /**
             * @type {Integer}
             */
            Spare2 {
                get => NumGet(this, 12, "uint")
                set => NumPut("uint", value, this, 12)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            DirectoryBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            MdlAddress {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
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
    
    }

    class _FileSystemControl_e__Union extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

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
    
        class _Common extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
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
        
        }
    
        class _Neither extends Win32Struct {
            static sizeof => 40
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
            InputBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            OutputBuffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            OutputMdlAddress {
                get => NumGet(this, 32, "ptr")
                set => NumPut("ptr", value, this, 32)
            }
        
        }
    
        class _Buffered extends Win32Struct {
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
            SystemBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
        }
    
        class _Direct extends Win32Struct {
            static sizeof => 40
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
            InputSystemBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            OutputBuffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            OutputMdlAddress {
                get => NumGet(this, 32, "ptr")
                set => NumPut("ptr", value, this, 32)
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
         * @type {_Common}
         */
        Common{
            get {
                if(!this.HasProp("__Common"))
                    this.__Common := %this.__Class%._Common(0, this)
                return this.__Common
            }
        }
    
        /**
         * @type {_Neither}
         */
        Neither{
            get {
                if(!this.HasProp("__Neither"))
                    this.__Neither := %this.__Class%._Neither(0, this)
                return this.__Neither
            }
        }
    
        /**
         * @type {_Buffered}
         */
        Buffered{
            get {
                if(!this.HasProp("__Buffered"))
                    this.__Buffered := %this.__Class%._Buffered(0, this)
                return this.__Buffered
            }
        }
    
        /**
         * @type {_Direct}
         */
        Direct{
            get {
                if(!this.HasProp("__Direct"))
                    this.__Direct := %this.__Class%._Direct(0, this)
                return this.__Direct
            }
        }
    
    }

    class _DeviceIoControl_e__Union extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        class _Common extends Win32Struct {
            static sizeof => 12
            static packingSize => 4
    
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
        
        }
    
        class _Neither extends Win32Struct {
            static sizeof => 40
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
            InputBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            OutputBuffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            OutputMdlAddress {
                get => NumGet(this, 32, "ptr")
                set => NumPut("ptr", value, this, 32)
            }
        
        }
    
        class _Buffered extends Win32Struct {
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
            SystemBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
        }
    
        class _Direct extends Win32Struct {
            static sizeof => 40
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
            InputSystemBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            OutputBuffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
            /**
             * @type {Pointer<MDL>}
             */
            OutputMdlAddress {
                get => NumGet(this, 32, "ptr")
                set => NumPut("ptr", value, this, 32)
            }
        
        }
    
        class _FastIo extends Win32Struct {
            static sizeof => 32
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
            InputBuffer {
                get => NumGet(this, 16, "ptr")
                set => NumPut("ptr", value, this, 16)
            }
        
            /**
             * @type {Pointer<Void>}
             */
            OutputBuffer {
                get => NumGet(this, 24, "ptr")
                set => NumPut("ptr", value, this, 24)
            }
        
        }
    
        /**
         * @type {_Common}
         */
        Common{
            get {
                if(!this.HasProp("__Common"))
                    this.__Common := %this.__Class%._Common(0, this)
                return this.__Common
            }
        }
    
        /**
         * @type {_Neither}
         */
        Neither{
            get {
                if(!this.HasProp("__Neither"))
                    this.__Neither := %this.__Class%._Neither(0, this)
                return this.__Neither
            }
        }
    
        /**
         * @type {_Buffered}
         */
        Buffered{
            get {
                if(!this.HasProp("__Buffered"))
                    this.__Buffered := %this.__Class%._Buffered(0, this)
                return this.__Buffered
            }
        }
    
        /**
         * @type {_Direct}
         */
        Direct{
            get {
                if(!this.HasProp("__Direct"))
                    this.__Direct := %this.__Class%._Direct(0, this)
                return this.__Direct
            }
        }
    
        /**
         * @type {_FastIo}
         */
        FastIo{
            get {
                if(!this.HasProp("__FastIo"))
                    this.__FastIo := %this.__Class%._FastIo(0, this)
                return this.__FastIo
            }
        }
    
    }

    class _LockControl extends Win32Struct {
        static sizeof => 40
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
    
        /**
         * @type {PEPROCESS}
         */
        ProcessId {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {BOOLEAN}
         */
        FailImmediately {
            get => NumGet(this, 32, "char")
            set => NumPut("char", value, this, 32)
        }
    
        /**
         * @type {BOOLEAN}
         */
        ExclusiveLock {
            get => NumGet(this, 33, "char")
            set => NumPut("char", value, this, 33)
        }
    
    }

    class _QuerySecurity extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

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
    
        /**
         * @type {Pointer<Void>}
         */
        SecurityBuffer {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
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

    class _QueryQuota extends Win32Struct {
        static sizeof => 48
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
    
        /**
         * @type {Pointer<Void>}
         */
        QuotaBuffer {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 40, "ptr")
            set => NumPut("ptr", value, this, 40)
        }
    
    }

    class _SetQuota extends Win32Struct {
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
        QuotaBuffer {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlAddress {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _Pnp_e__Union extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

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
    
    }

    class _AcquireForSectionSynchronization extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        SyncType {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PageProtection {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Pointer<FS_FILTER_SECTION_SYNC_OUTPUT>}
         */
        OutputInformation {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        AllocationAttributes {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _AcquireForModifiedPageWriter extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Integer>}
         */
        EndingOffset {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Pointer<ERESOURCE>>}
         */
        ResourceToRelease {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _ReleaseForModifiedPageWriter extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<ERESOURCE>}
         */
        ResourceToRelease {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    class _QueryOpen extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Pointer<IRP>}
         */
        Irp {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        FileInformation {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Integer>}
         */
        Length {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        FileInformationClass {
            get => NumGet(this, 24, "int")
            set => NumPut("int", value, this, 24)
        }
    
    }

    class _FastIoCheckIfPossible extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FileOffset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        LockKey {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {BOOLEAN}
         */
        CheckForReadOperation {
            get => NumGet(this, 16, "char")
            set => NumPut("char", value, this, 16)
        }
    
    }

    class _NetworkQueryOpen extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<IRP>}
         */
        Irp {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<FILE_NETWORK_OPEN_INFORMATION>}
         */
        NetworkInformation {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _MdlRead extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FileOffset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Key {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Pointer<Pointer<MDL>>}
         */
        MdlChain {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _MdlReadComplete extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<MDL>}
         */
        MdlChain {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

    class _PrepareMdlWrite extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FileOffset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Key {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Pointer<Pointer<MDL>>}
         */
        MdlChain {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _MdlWriteComplete extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FileOffset {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Pointer<MDL>}
         */
        MdlChain {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _MountVolume extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        DeviceType {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    class _Others extends Win32Struct {
        static sizeof => 48
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
    
        /**
         * @type {Pointer<Void>}
         */
        Argument5 {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        Argument6 {
            get => NumGet(this, 40, "int64")
            set => NumPut("int64", value, this, 40)
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
     * @type {_QueryFileInformation}
     */
    QueryFileInformation{
        get {
            if(!this.HasProp("__QueryFileInformation"))
                this.__QueryFileInformation := %this.__Class%._QueryFileInformation(0, this)
            return this.__QueryFileInformation
        }
    }

    /**
     * @type {_SetFileInformation}
     */
    SetFileInformation{
        get {
            if(!this.HasProp("__SetFileInformation"))
                this.__SetFileInformation := %this.__Class%._SetFileInformation(0, this)
            return this.__SetFileInformation
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
     * @type {_QueryVolumeInformation}
     */
    QueryVolumeInformation{
        get {
            if(!this.HasProp("__QueryVolumeInformation"))
                this.__QueryVolumeInformation := %this.__Class%._QueryVolumeInformation(0, this)
            return this.__QueryVolumeInformation
        }
    }

    /**
     * @type {_SetVolumeInformation}
     */
    SetVolumeInformation{
        get {
            if(!this.HasProp("__SetVolumeInformation"))
                this.__SetVolumeInformation := %this.__Class%._SetVolumeInformation(0, this)
            return this.__SetVolumeInformation
        }
    }

    /**
     * @type {_DirectoryControl_e__Union}
     */
    DirectoryControl{
        get {
            if(!this.HasProp("__DirectoryControl"))
                this.__DirectoryControl := %this.__Class%._DirectoryControl_e__Union(0, this)
            return this.__DirectoryControl
        }
    }

    /**
     * @type {_FileSystemControl_e__Union}
     */
    FileSystemControl{
        get {
            if(!this.HasProp("__FileSystemControl"))
                this.__FileSystemControl := %this.__Class%._FileSystemControl_e__Union(0, this)
            return this.__FileSystemControl
        }
    }

    /**
     * @type {_DeviceIoControl_e__Union}
     */
    DeviceIoControl{
        get {
            if(!this.HasProp("__DeviceIoControl"))
                this.__DeviceIoControl := %this.__Class%._DeviceIoControl_e__Union(0, this)
            return this.__DeviceIoControl
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
     * @type {_Pnp_e__Union}
     */
    Pnp{
        get {
            if(!this.HasProp("__Pnp"))
                this.__Pnp := %this.__Class%._Pnp_e__Union(0, this)
            return this.__Pnp
        }
    }

    /**
     * @type {_AcquireForSectionSynchronization}
     */
    AcquireForSectionSynchronization{
        get {
            if(!this.HasProp("__AcquireForSectionSynchronization"))
                this.__AcquireForSectionSynchronization := %this.__Class%._AcquireForSectionSynchronization(0, this)
            return this.__AcquireForSectionSynchronization
        }
    }

    /**
     * @type {_AcquireForModifiedPageWriter}
     */
    AcquireForModifiedPageWriter{
        get {
            if(!this.HasProp("__AcquireForModifiedPageWriter"))
                this.__AcquireForModifiedPageWriter := %this.__Class%._AcquireForModifiedPageWriter(0, this)
            return this.__AcquireForModifiedPageWriter
        }
    }

    /**
     * @type {_ReleaseForModifiedPageWriter}
     */
    ReleaseForModifiedPageWriter{
        get {
            if(!this.HasProp("__ReleaseForModifiedPageWriter"))
                this.__ReleaseForModifiedPageWriter := %this.__Class%._ReleaseForModifiedPageWriter(0, this)
            return this.__ReleaseForModifiedPageWriter
        }
    }

    /**
     * @type {_QueryOpen}
     */
    QueryOpen{
        get {
            if(!this.HasProp("__QueryOpen"))
                this.__QueryOpen := %this.__Class%._QueryOpen(0, this)
            return this.__QueryOpen
        }
    }

    /**
     * @type {_FastIoCheckIfPossible}
     */
    FastIoCheckIfPossible{
        get {
            if(!this.HasProp("__FastIoCheckIfPossible"))
                this.__FastIoCheckIfPossible := %this.__Class%._FastIoCheckIfPossible(0, this)
            return this.__FastIoCheckIfPossible
        }
    }

    /**
     * @type {_NetworkQueryOpen}
     */
    NetworkQueryOpen{
        get {
            if(!this.HasProp("__NetworkQueryOpen"))
                this.__NetworkQueryOpen := %this.__Class%._NetworkQueryOpen(0, this)
            return this.__NetworkQueryOpen
        }
    }

    /**
     * @type {_MdlRead}
     */
    MdlRead{
        get {
            if(!this.HasProp("__MdlRead"))
                this.__MdlRead := %this.__Class%._MdlRead(0, this)
            return this.__MdlRead
        }
    }

    /**
     * @type {_MdlReadComplete}
     */
    MdlReadComplete{
        get {
            if(!this.HasProp("__MdlReadComplete"))
                this.__MdlReadComplete := %this.__Class%._MdlReadComplete(0, this)
            return this.__MdlReadComplete
        }
    }

    /**
     * @type {_PrepareMdlWrite}
     */
    PrepareMdlWrite{
        get {
            if(!this.HasProp("__PrepareMdlWrite"))
                this.__PrepareMdlWrite := %this.__Class%._PrepareMdlWrite(0, this)
            return this.__PrepareMdlWrite
        }
    }

    /**
     * @type {_MdlWriteComplete}
     */
    MdlWriteComplete{
        get {
            if(!this.HasProp("__MdlWriteComplete"))
                this.__MdlWriteComplete := %this.__Class%._MdlWriteComplete(0, this)
            return this.__MdlWriteComplete
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
