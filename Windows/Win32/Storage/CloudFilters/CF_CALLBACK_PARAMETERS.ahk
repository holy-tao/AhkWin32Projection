#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains callback specific parameters such as file offset, length, flags, etc.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_callback_parameters
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_PARAMETERS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ParamSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _Cancel extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        class _FetchData extends Win32Struct {
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
             * @type {Integer}
             */
            Length {
                get => NumGet(this, 8, "int64")
                set => NumPut("int64", value, this, 8)
            }
        
        }
    
        /**
         * @type {_FetchData}
         */
        FetchData{
            get {
                if(!this.HasProp("__FetchData"))
                    this.__FetchData := %this.__Class%._FetchData(this.ptr + 8)
                return this.__FetchData
            }
        }
    
    }

    class _FetchData extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        RequiredFileOffset {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        RequiredLength {
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        OptionalFileOffset {
            get => NumGet(this, 24, "int64")
            set => NumPut("int64", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        OptionalLength {
            get => NumGet(this, 32, "int64")
            set => NumPut("int64", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        LastDehydrationTime {
            get => NumGet(this, 40, "int64")
            set => NumPut("int64", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        LastDehydrationReason {
            get => NumGet(this, 48, "int")
            set => NumPut("int", value, this, 48)
        }
    
    }

    class _ValidateData extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        RequiredFileOffset {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        RequiredLength {
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
    }

    class _FetchPlaceholders extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        Pattern {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _OpenCompletion extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    class _CloseCompletion extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    class _Dehydrate extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reason {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    class _DehydrateCompletion extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Reason {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    class _Delete extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    class _DeleteCompletion extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
    }

    class _Rename extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        TargetPath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _RenameCompletion extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        SourcePath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    /**
     * @type {_Cancel}
     */
    Cancel{
        get {
            if(!this.HasProp("__Cancel"))
                this.__Cancel := %this.__Class%._Cancel(this.ptr + 8)
            return this.__Cancel
        }
    }

    /**
     * @type {_FetchData}
     */
    FetchData{
        get {
            if(!this.HasProp("__FetchData"))
                this.__FetchData := %this.__Class%._FetchData(this.ptr + 8)
            return this.__FetchData
        }
    }

    /**
     * @type {_ValidateData}
     */
    ValidateData{
        get {
            if(!this.HasProp("__ValidateData"))
                this.__ValidateData := %this.__Class%._ValidateData(this.ptr + 8)
            return this.__ValidateData
        }
    }

    /**
     * @type {_FetchPlaceholders}
     */
    FetchPlaceholders{
        get {
            if(!this.HasProp("__FetchPlaceholders"))
                this.__FetchPlaceholders := %this.__Class%._FetchPlaceholders(this.ptr + 8)
            return this.__FetchPlaceholders
        }
    }

    /**
     * @type {_OpenCompletion}
     */
    OpenCompletion{
        get {
            if(!this.HasProp("__OpenCompletion"))
                this.__OpenCompletion := %this.__Class%._OpenCompletion(this.ptr + 8)
            return this.__OpenCompletion
        }
    }

    /**
     * @type {_CloseCompletion}
     */
    CloseCompletion{
        get {
            if(!this.HasProp("__CloseCompletion"))
                this.__CloseCompletion := %this.__Class%._CloseCompletion(this.ptr + 8)
            return this.__CloseCompletion
        }
    }

    /**
     * @type {_Dehydrate}
     */
    Dehydrate{
        get {
            if(!this.HasProp("__Dehydrate"))
                this.__Dehydrate := %this.__Class%._Dehydrate(this.ptr + 8)
            return this.__Dehydrate
        }
    }

    /**
     * @type {_DehydrateCompletion}
     */
    DehydrateCompletion{
        get {
            if(!this.HasProp("__DehydrateCompletion"))
                this.__DehydrateCompletion := %this.__Class%._DehydrateCompletion(this.ptr + 8)
            return this.__DehydrateCompletion
        }
    }

    /**
     * @type {_Delete}
     */
    Delete{
        get {
            if(!this.HasProp("__Delete"))
                this.__Delete := %this.__Class%._Delete(this.ptr + 8)
            return this.__Delete
        }
    }

    /**
     * @type {_DeleteCompletion}
     */
    DeleteCompletion{
        get {
            if(!this.HasProp("__DeleteCompletion"))
                this.__DeleteCompletion := %this.__Class%._DeleteCompletion(this.ptr + 8)
            return this.__DeleteCompletion
        }
    }

    /**
     * @type {_Rename}
     */
    Rename{
        get {
            if(!this.HasProp("__Rename"))
                this.__Rename := %this.__Class%._Rename(this.ptr + 8)
            return this.__Rename
        }
    }

    /**
     * @type {_RenameCompletion}
     */
    RenameCompletion{
        get {
            if(!this.HasProp("__RenameCompletion"))
                this.__RenameCompletion := %this.__Class%._RenameCompletion(this.ptr + 8)
            return this.__RenameCompletion
        }
    }
}
