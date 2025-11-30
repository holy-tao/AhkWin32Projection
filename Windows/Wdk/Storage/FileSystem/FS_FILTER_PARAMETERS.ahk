#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FS_FILTER_PARAMETERS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

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
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 28, "int")
            set => NumPut("int", value, this, 28)
        }
    
    }

    class _Others extends Win32Struct {
        static sizeof => 40
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
