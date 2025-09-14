#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies parameters required for completing certain callbacks.
 * @remarks
 * For any callback except <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb">PRJ_CANCEL_COMMAND_CB</a>, the provider may opt to process the callback asynchronously. To do so it returns HRESULT_FROM_WIN32(ERROR_IO_PENDING) from the callback. Once the provider has finished processing the callback. 
  * 
  * If the provider calls this function for the commandId passed by the <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_cancel_command_cb">PRJ_CANCEL_COMMAND_CB</a> callback it is not an error, however it is a no-op because the I/O that caused the callback invocation identified by commandId has already ended.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_complete_command_extended_parameters
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_COMPLETE_COMMAND_EXTENDED_PARAMETERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of command.
     * @type {Integer}
     */
    CommandType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NotificationMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<PRJ_DIR_ENTRY_BUFFER_HANDLE>}
     */
    Enumeration {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }
}
