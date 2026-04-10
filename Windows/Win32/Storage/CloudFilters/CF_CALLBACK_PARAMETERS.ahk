#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CF_CALLBACK_CANCEL_FLAGS.ahk
#Include .\CF_CALLBACK_FETCH_DATA_FLAGS.ahk
#Include .\CF_CALLBACK_DEHYDRATION_REASON.ahk
#Include .\CF_CALLBACK_VALIDATE_DATA_FLAGS.ahk
#Include .\CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS.ahk
#Include .\CF_CALLBACK_OPEN_COMPLETION_FLAGS.ahk
#Include .\CF_CALLBACK_CLOSE_COMPLETION_FLAGS.ahk
#Include .\CF_CALLBACK_DEHYDRATE_FLAGS.ahk
#Include .\CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS.ahk
#Include .\CF_CALLBACK_DELETE_FLAGS.ahk
#Include .\CF_CALLBACK_DELETE_COMPLETION_FLAGS.ahk
#Include .\CF_CALLBACK_RENAME_FLAGS.ahk
#Include .\CF_CALLBACK_RENAME_COMPLETION_FLAGS.ahk

/**
 * Contains callback specific parameters such as file offset, length, flags, etc.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_callback_parameters
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_CALLBACK_PARAMETERS extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * _ParamSize_ is set based on the callback being performed.
     * 
     * | Callback | ParamSize Information |
     * |--------|--------|
     * | CF_CALLBACK_TYPE_FETCH_DATA | Set to the size of `FetchData` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_VALIDATE_DATA | Set to the size of `ValidateData` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_CANCEL_FETCH_DATA | Set to the size of `Cancel.FetchData` plus the size of two `ULONG`s. |
     * | CF_CALLBACK_TYPE_FETCH_PLACHOLDERS | Set to the size of `FetchPlaceholders` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_CANCEL_FETCH_PLACHOLDERS | Set to the size of two `ULONG`s. |
     * | CF_CALLBACK_TYPE_NOTIFY_FILE_OPEN_COMPLETION | Set to the size of `OpenCompletion` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_FILE_CLOSE_COMPLETION | set to the size of `CloseCompletion` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE | Set to the size of `Dehydrate` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_DEHYDRATE_COMPLETION | Set to the size of `DehydrateCompletion` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_DELETE | Set to the size of `Delete` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_DELETE_COMPLETION | Set to the size of `DeleteCompletion` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_RENAME | Set to the size of `Rename` plus the size of a `ULONG`. |
     * | CF_CALLBACK_TYPE_NOTIFY_RENAME_COMPLETION | Set to the size of `RenameCompletion` plus the size of a `ULONG`. |
     * @type {Integer}
     */
    ParamSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    class _Cancel extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {CF_CALLBACK_CANCEL_FLAGS}
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
        FetchData {
            get {
                if(!this.HasProp("__FetchData"))
                    this.__FetchData := CF_CALLBACK_PARAMETERS._Cancel._FetchData(8, this)
                return this.__FetchData
            }
        }
    }

    class _FetchData extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * @type {CF_CALLBACK_FETCH_DATA_FLAGS}
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
         * @type {CF_CALLBACK_DEHYDRATION_REASON}
         */
        LastDehydrationReason {
            get => NumGet(this, 48, "int")
            set => NumPut("int", value, this, 48)
        }
    }

    class _ValidateData extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

        /**
         * @type {CF_CALLBACK_VALIDATE_DATA_FLAGS}
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
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        Pattern {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    class _OpenCompletion extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {CF_CALLBACK_OPEN_COMPLETION_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    }

    class _CloseCompletion extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {CF_CALLBACK_CLOSE_COMPLETION_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    }

    class _Dehydrate extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {CF_CALLBACK_DEHYDRATE_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {CF_CALLBACK_DEHYDRATION_REASON}
         */
        Reason {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    }

    class _DehydrateCompletion extends Win32Struct {
        static sizeof => 8
        static packingSize => 4

        /**
         * @type {CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {CF_CALLBACK_DEHYDRATION_REASON}
         */
        Reason {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    }

    class _Delete extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {CF_CALLBACK_DELETE_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    }

    class _DeleteCompletion extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {CF_CALLBACK_DELETE_COMPLETION_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    }

    class _Rename extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {CF_CALLBACK_RENAME_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        TargetPath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    class _RenameCompletion extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {CF_CALLBACK_RENAME_COMPLETION_FLAGS}
         */
        Flags {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {PWSTR}
         */
        SourcePath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    }

    /**
     * @type {_Cancel}
     */
    Cancel {
        get {
            if(!this.HasProp("__Cancel"))
                this.__Cancel := CF_CALLBACK_PARAMETERS._Cancel(8, this)
            return this.__Cancel
        }
    }

    /**
     * @type {_FetchData}
     */
    FetchData {
        get {
            if(!this.HasProp("__FetchData"))
                this.__FetchData := CF_CALLBACK_PARAMETERS._FetchData(8, this)
            return this.__FetchData
        }
    }

    /**
     * @type {_ValidateData}
     */
    ValidateData {
        get {
            if(!this.HasProp("__ValidateData"))
                this.__ValidateData := CF_CALLBACK_PARAMETERS._ValidateData(8, this)
            return this.__ValidateData
        }
    }

    /**
     * @type {_FetchPlaceholders}
     */
    FetchPlaceholders {
        get {
            if(!this.HasProp("__FetchPlaceholders"))
                this.__FetchPlaceholders := CF_CALLBACK_PARAMETERS._FetchPlaceholders(8, this)
            return this.__FetchPlaceholders
        }
    }

    /**
     * @type {_OpenCompletion}
     */
    OpenCompletion {
        get {
            if(!this.HasProp("__OpenCompletion"))
                this.__OpenCompletion := CF_CALLBACK_PARAMETERS._OpenCompletion(8, this)
            return this.__OpenCompletion
        }
    }

    /**
     * @type {_CloseCompletion}
     */
    CloseCompletion {
        get {
            if(!this.HasProp("__CloseCompletion"))
                this.__CloseCompletion := CF_CALLBACK_PARAMETERS._CloseCompletion(8, this)
            return this.__CloseCompletion
        }
    }

    /**
     * @type {_Dehydrate}
     */
    Dehydrate {
        get {
            if(!this.HasProp("__Dehydrate"))
                this.__Dehydrate := CF_CALLBACK_PARAMETERS._Dehydrate(8, this)
            return this.__Dehydrate
        }
    }

    /**
     * @type {_DehydrateCompletion}
     */
    DehydrateCompletion {
        get {
            if(!this.HasProp("__DehydrateCompletion"))
                this.__DehydrateCompletion := CF_CALLBACK_PARAMETERS._DehydrateCompletion(8, this)
            return this.__DehydrateCompletion
        }
    }

    /**
     * @type {_Delete}
     */
    Delete {
        get {
            if(!this.HasProp("__Delete"))
                this.__Delete := CF_CALLBACK_PARAMETERS._Delete(8, this)
            return this.__Delete
        }
    }

    /**
     * @type {_DeleteCompletion}
     */
    DeleteCompletion {
        get {
            if(!this.HasProp("__DeleteCompletion"))
                this.__DeleteCompletion := CF_CALLBACK_PARAMETERS._DeleteCompletion(8, this)
            return this.__DeleteCompletion
        }
    }

    /**
     * @type {_Rename}
     */
    Rename {
        get {
            if(!this.HasProp("__Rename"))
                this.__Rename := CF_CALLBACK_PARAMETERS._Rename(8, this)
            return this.__Rename
        }
    }

    /**
     * @type {_RenameCompletion}
     */
    RenameCompletion {
        get {
            if(!this.HasProp("__RenameCompletion"))
                this.__RenameCompletion := CF_CALLBACK_PARAMETERS._RenameCompletion(8, this)
            return this.__RenameCompletion
        }
    }
}
