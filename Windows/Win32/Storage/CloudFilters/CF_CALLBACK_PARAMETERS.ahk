#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_CALLBACK_DELETE_COMPLETION_FLAGS.ahk" { CF_CALLBACK_DELETE_COMPLETION_FLAGS }
#Import ".\CF_CALLBACK_CLOSE_COMPLETION_FLAGS.ahk" { CF_CALLBACK_CLOSE_COMPLETION_FLAGS }
#Import ".\CF_CALLBACK_DELETE_FLAGS.ahk" { CF_CALLBACK_DELETE_FLAGS }
#Import ".\CF_CALLBACK_RENAME_FLAGS.ahk" { CF_CALLBACK_RENAME_FLAGS }
#Import ".\CF_CALLBACK_CANCEL_FLAGS.ahk" { CF_CALLBACK_CANCEL_FLAGS }
#Import ".\CF_CALLBACK_DEHYDRATION_REASON.ahk" { CF_CALLBACK_DEHYDRATION_REASON }
#Import ".\CF_CALLBACK_DEHYDRATE_FLAGS.ahk" { CF_CALLBACK_DEHYDRATE_FLAGS }
#Import ".\CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS.ahk" { CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS }
#Import ".\CF_CALLBACK_VALIDATE_DATA_FLAGS.ahk" { CF_CALLBACK_VALIDATE_DATA_FLAGS }
#Import ".\CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS.ahk" { CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CF_CALLBACK_OPEN_COMPLETION_FLAGS.ahk" { CF_CALLBACK_OPEN_COMPLETION_FLAGS }
#Import ".\CF_CALLBACK_FETCH_DATA_FLAGS.ahk" { CF_CALLBACK_FETCH_DATA_FLAGS }
#Import ".\CF_CALLBACK_RENAME_COMPLETION_FLAGS.ahk" { CF_CALLBACK_RENAME_COMPLETION_FLAGS }

/**
 * Contains callback specific parameters such as file offset, length, flags, etc.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_callback_parameters
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_CALLBACK_PARAMETERS {
    #StructPack 8


    struct _Cancel {

        struct _FetchData {
            FileOffset : Int64

            Length : Int64

        }

        Flags : CF_CALLBACK_CANCEL_FLAGS

        FetchData : CF_CALLBACK_PARAMETERS._Cancel._FetchData

    }

    struct _FetchData {
        Flags : CF_CALLBACK_FETCH_DATA_FLAGS

        RequiredFileOffset : Int64

        RequiredLength : Int64

        OptionalFileOffset : Int64

        OptionalLength : Int64

        LastDehydrationTime : Int64

        LastDehydrationReason : CF_CALLBACK_DEHYDRATION_REASON

    }

    struct _ValidateData {
        Flags : CF_CALLBACK_VALIDATE_DATA_FLAGS

        RequiredFileOffset : Int64

        RequiredLength : Int64

    }

    struct _FetchPlaceholders {
        Flags : CF_CALLBACK_FETCH_PLACEHOLDERS_FLAGS

        Pattern : PWSTR

    }

    struct _OpenCompletion {
        Flags : CF_CALLBACK_OPEN_COMPLETION_FLAGS

    }

    struct _CloseCompletion {
        Flags : CF_CALLBACK_CLOSE_COMPLETION_FLAGS

    }

    struct _Dehydrate {
        Flags : CF_CALLBACK_DEHYDRATE_FLAGS

        Reason : CF_CALLBACK_DEHYDRATION_REASON

    }

    struct _DehydrateCompletion {
        Flags : CF_CALLBACK_DEHYDRATE_COMPLETION_FLAGS

        Reason : CF_CALLBACK_DEHYDRATION_REASON

    }

    struct _Delete {
        Flags : CF_CALLBACK_DELETE_FLAGS

    }

    struct _DeleteCompletion {
        Flags : CF_CALLBACK_DELETE_COMPLETION_FLAGS

    }

    struct _Rename {
        Flags : CF_CALLBACK_RENAME_FLAGS

        TargetPath : PWSTR

    }

    struct _RenameCompletion {
        Flags : CF_CALLBACK_RENAME_COMPLETION_FLAGS

        SourcePath : PWSTR

    }

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
     */
    ParamSize : UInt32

    Cancel : CF_CALLBACK_PARAMETERS._Cancel

    static __New() {
        DefineProp(this.Prototype, 'FetchData', { type: CF_CALLBACK_PARAMETERS._FetchData, offset: 8 })
        DefineProp(this.Prototype, 'ValidateData', { type: CF_CALLBACK_PARAMETERS._ValidateData, offset: 8 })
        DefineProp(this.Prototype, 'FetchPlaceholders', { type: CF_CALLBACK_PARAMETERS._FetchPlaceholders, offset: 8 })
        DefineProp(this.Prototype, 'OpenCompletion', { type: CF_CALLBACK_PARAMETERS._OpenCompletion, offset: 8 })
        DefineProp(this.Prototype, 'CloseCompletion', { type: CF_CALLBACK_PARAMETERS._CloseCompletion, offset: 8 })
        DefineProp(this.Prototype, 'Dehydrate', { type: CF_CALLBACK_PARAMETERS._Dehydrate, offset: 8 })
        DefineProp(this.Prototype, 'DehydrateCompletion', { type: CF_CALLBACK_PARAMETERS._DehydrateCompletion, offset: 8 })
        DefineProp(this.Prototype, 'Delete', { type: CF_CALLBACK_PARAMETERS._Delete, offset: 8 })
        DefineProp(this.Prototype, 'DeleteCompletion', { type: CF_CALLBACK_PARAMETERS._DeleteCompletion, offset: 8 })
        DefineProp(this.Prototype, 'Rename', { type: CF_CALLBACK_PARAMETERS._Rename, offset: 8 })
        DefineProp(this.Prototype, 'RenameCompletion', { type: CF_CALLBACK_PARAMETERS._RenameCompletion, offset: 8 })
        this.DeleteProp("__New")
    }
}
