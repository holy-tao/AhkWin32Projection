#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_NOTIFY_TYPES.ahk" { PRJ_NOTIFY_TYPES }
#Import ".\PRJ_COMPLETE_COMMAND_TYPE.ahk" { PRJ_COMPLETE_COMMAND_TYPE }
#Import ".\PRJ_DIR_ENTRY_BUFFER_HANDLE.ahk" { PRJ_DIR_ENTRY_BUFFER_HANDLE }

/**
 * Specifies parameters required for completing certain callbacks.
 * @remarks
 * For any callback except <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb">PRJ_CANCEL_COMMAND_CB</a>, the provider may opt to process the callback asynchronously. To do so it returns HRESULT_FROM_WIN32(ERROR_IO_PENDING) from the callback. Once the provider has finished processing the callback. 
 * 
 * If the provider calls this function for the commandId passed by the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb">PRJ_CANCEL_COMMAND_CB</a> callback it is not an error, however it is a no-op because the I/O that caused the callback invocation identified by commandId has already ended.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_complete_command_extended_parameters
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS {
    #StructPack 8


    struct _Notification {
        NotificationMask : PRJ_NOTIFY_TYPES

    }

    struct _Enumeration {
        DirEntryBufferHandle : PRJ_DIR_ENTRY_BUFFER_HANDLE

    }

    /**
     * The type of command.
     */
    CommandType : PRJ_COMPLETE_COMMAND_TYPE

    Notification : PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS._Notification

    static __New() {
        DefineProp(this.Prototype, 'Enumeration', { type: PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS._Enumeration, offset: 8 })
        this.DeleteProp("__New")
    }
}
