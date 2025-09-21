#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LOG_MANAGEMENT_CALLBACKS structure is used to register with the Common Log File System (CLFS) for the callbacks that a client program requires information from.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/ns-clfsmgmtw32-log_management_callbacks
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class LOG_MANAGEMENT_CALLBACKS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to the context which is a client-defined value.  CLFS ignores this value other than to pass it with every callback to the client.
     * @type {Pointer<Void>}
     */
    CallbackContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Called when the management functionality determines that the client should advance the tail of its log.
     * @type {Pointer<PLOG_TAIL_ADVANCE_CALLBACK>}
     */
    AdvanceTailCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Called when an asynchronous request is initiated when <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nf-clfsmgmtw32-handlelogfull">HandleLogFull</a> completes.
     * @type {Pointer<PLOG_FULL_HANDLER_CALLBACK>}
     */
    LogFullHandlerCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Called when a pinned log becomes unpinned.
     * @type {Pointer<PLOG_UNPINNED_CALLBACK>}
     */
    LogUnpinnedCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
