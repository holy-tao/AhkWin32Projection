#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains callback specific parameters such as file offset, length, flags, etc.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_callback_parameters
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CALLBACK_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

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

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FileOffset {
        get => NumGet(this, 12, "int64")
        set => NumPut("int64", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 20, "int64")
        set => NumPut("int64", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    RequiredFileOffset {
        get => NumGet(this, 12, "int64")
        set => NumPut("int64", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    RequiredLength {
        get => NumGet(this, 20, "int64")
        set => NumPut("int64", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    OptionalFileOffset {
        get => NumGet(this, 28, "int64")
        set => NumPut("int64", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    OptionalLength {
        get => NumGet(this, 36, "int64")
        set => NumPut("int64", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    LastDehydrationTime {
        get => NumGet(this, 44, "int64")
        set => NumPut("int64", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    LastDehydrationReason {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    Pattern {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Reason {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    TargetPath {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SourcePath {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }
}
