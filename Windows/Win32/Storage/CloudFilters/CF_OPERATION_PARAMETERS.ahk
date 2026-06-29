#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS.ahk" { CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS }
#Import ".\CF_OPERATION_ACK_DATA_FLAGS.ahk" { CF_OPERATION_ACK_DATA_FLAGS }
#Import ".\CF_OPERATION_ACK_DEHYDRATE_FLAGS.ahk" { CF_OPERATION_ACK_DEHYDRATE_FLAGS }
#Import ".\CF_OPERATION_RETRIEVE_DATA_FLAGS.ahk" { CF_OPERATION_RETRIEVE_DATA_FLAGS }
#Import ".\CF_PLACEHOLDER_CREATE_INFO.ahk" { CF_PLACEHOLDER_CREATE_INFO }
#Import ".\CF_FS_METADATA.ahk" { CF_FS_METADATA }
#Import ".\CF_OPERATION_ACK_DELETE_FLAGS.ahk" { CF_OPERATION_ACK_DELETE_FLAGS }
#Import ".\CF_OPERATION_ACK_RENAME_FLAGS.ahk" { CF_OPERATION_ACK_RENAME_FLAGS }
#Import ".\CF_OPERATION_TRANSFER_DATA_FLAGS.ahk" { CF_OPERATION_TRANSFER_DATA_FLAGS }
#Import ".\CF_OPERATION_RESTART_HYDRATION_FLAGS.ahk" { CF_OPERATION_RESTART_HYDRATION_FLAGS }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * Parameters of an operation on a placeholder file or folder.
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_operation_parameters
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_OPERATION_PARAMETERS {
    #StructPack 8


    struct _TransferData {
        Flags : CF_OPERATION_TRANSFER_DATA_FLAGS

        CompletionStatus : NTSTATUS

        Buffer : IntPtr

        Offset : Int64

        Length : Int64

    }

    struct _RetrieveData {
        Flags : CF_OPERATION_RETRIEVE_DATA_FLAGS

        Buffer : IntPtr

        Offset : Int64

        Length : Int64

        ReturnedLength : Int64

    }

    struct _AckData {
        Flags : CF_OPERATION_ACK_DATA_FLAGS

        CompletionStatus : NTSTATUS

        Offset : Int64

        Length : Int64

    }

    struct _RestartHydration {
        Flags : CF_OPERATION_RESTART_HYDRATION_FLAGS

        FsMetadata : CF_FS_METADATA.Ptr

        FileIdentity : IntPtr

        FileIdentityLength : UInt32

    }

    struct _TransferPlaceholders {
        Flags : CF_OPERATION_TRANSFER_PLACEHOLDERS_FLAGS

        CompletionStatus : NTSTATUS

        PlaceholderTotalCount : Int64

        PlaceholderArray : CF_PLACEHOLDER_CREATE_INFO.Ptr

        PlaceholderCount : UInt32

        EntriesProcessed : UInt32

    }

    struct _AckDehydrate {
        Flags : CF_OPERATION_ACK_DEHYDRATE_FLAGS

        CompletionStatus : NTSTATUS

        FileIdentity : IntPtr

        FileIdentityLength : UInt32

    }

    struct _AckRename {
        Flags : CF_OPERATION_ACK_RENAME_FLAGS

        CompletionStatus : NTSTATUS

    }

    struct _AckDelete {
        Flags : CF_OPERATION_ACK_DELETE_FLAGS

        CompletionStatus : NTSTATUS

    }

    ParamSize : UInt32

    TransferData : CF_OPERATION_PARAMETERS._TransferData

    static __New() {
        DefineProp(this.Prototype, 'RetrieveData', { type: CF_OPERATION_PARAMETERS._RetrieveData, offset: 8 })
        DefineProp(this.Prototype, 'AckData', { type: CF_OPERATION_PARAMETERS._AckData, offset: 8 })
        DefineProp(this.Prototype, 'RestartHydration', { type: CF_OPERATION_PARAMETERS._RestartHydration, offset: 8 })
        DefineProp(this.Prototype, 'TransferPlaceholders', { type: CF_OPERATION_PARAMETERS._TransferPlaceholders, offset: 8 })
        DefineProp(this.Prototype, 'AckDehydrate', { type: CF_OPERATION_PARAMETERS._AckDehydrate, offset: 8 })
        DefineProp(this.Prototype, 'AckRename', { type: CF_OPERATION_PARAMETERS._AckRename, offset: 8 })
        DefineProp(this.Prototype, 'AckDelete', { type: CF_OPERATION_PARAMETERS._AckDelete, offset: 8 })
        this.DeleteProp("__New")
    }
}
