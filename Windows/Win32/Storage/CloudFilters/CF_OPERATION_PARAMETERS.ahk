#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Parameters of an operation on a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_operation_parameters
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_PARAMETERS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ParamSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _TransferData extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
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
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 24, "int64")
            set => NumPut("int64", value, this, 24)
        }
    
    }

    class _RetrieveData extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
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
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 24, "int64")
            set => NumPut("int64", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        ReturnedLength {
            get => NumGet(this, 32, "int64")
            set => NumPut("int64", value, this, 32)
        }
    
    }

    class _AckData extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        Offset {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        Length {
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
    }

    class _RestartHydration extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<CF_FS_METADATA>}
         */
        FsMetadata {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        FileIdentity {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        FileIdentityLength {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
    }

    class _TransferPlaceholders extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        PlaceholderTotalCount {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
        /**
         * @type {Pointer<CF_PLACEHOLDER_CREATE_INFO>}
         */
        PlaceholderArray {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        PlaceholderCount {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        EntriesProcessed {
            get => NumGet(this, 28, "uint")
            set => NumPut("uint", value, this, 28)
        }
    
    }

    class _AckDehydrate extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        FileIdentity {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        FileIdentityLength {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _AckRename extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    class _AckDelete extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {NTSTATUS}
         */
        CompletionStatus {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    /**
     * @type {_TransferData}
     */
    TransferData{
        get {
            if(!this.HasProp("__TransferData"))
                this.__TransferData := %this.__Class%._TransferData(8, this)
            return this.__TransferData
        }
    }

    /**
     * @type {_RetrieveData}
     */
    RetrieveData{
        get {
            if(!this.HasProp("__RetrieveData"))
                this.__RetrieveData := %this.__Class%._RetrieveData(8, this)
            return this.__RetrieveData
        }
    }

    /**
     * @type {_AckData}
     */
    AckData{
        get {
            if(!this.HasProp("__AckData"))
                this.__AckData := %this.__Class%._AckData(8, this)
            return this.__AckData
        }
    }

    /**
     * @type {_RestartHydration}
     */
    RestartHydration{
        get {
            if(!this.HasProp("__RestartHydration"))
                this.__RestartHydration := %this.__Class%._RestartHydration(8, this)
            return this.__RestartHydration
        }
    }

    /**
     * @type {_TransferPlaceholders}
     */
    TransferPlaceholders{
        get {
            if(!this.HasProp("__TransferPlaceholders"))
                this.__TransferPlaceholders := %this.__Class%._TransferPlaceholders(8, this)
            return this.__TransferPlaceholders
        }
    }

    /**
     * @type {_AckDehydrate}
     */
    AckDehydrate{
        get {
            if(!this.HasProp("__AckDehydrate"))
                this.__AckDehydrate := %this.__Class%._AckDehydrate(8, this)
            return this.__AckDehydrate
        }
    }

    /**
     * @type {_AckRename}
     */
    AckRename{
        get {
            if(!this.HasProp("__AckRename"))
                this.__AckRename := %this.__Class%._AckRename(8, this)
            return this.__AckRename
        }
    }

    /**
     * @type {_AckDelete}
     */
    AckDelete{
        get {
            if(!this.HasProp("__AckDelete"))
                this.__AckDelete := %this.__Class%._AckDelete(8, this)
            return this.__AckDelete
        }
    }
}
