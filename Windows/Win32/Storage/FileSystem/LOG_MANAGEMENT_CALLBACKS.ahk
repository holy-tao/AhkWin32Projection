#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LOG_MANAGEMENT_CALLBACKS structure is used to register with the Common Log File System (CLFS) for the callbacks that a client program requires information from.
 * @see https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/ns-clfsmgmtw32-log_management_callbacks
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct LOG_MANAGEMENT_CALLBACKS {
    #StructPack 8

    /**
     * A pointer to the context which is a client-defined value.  CLFS ignores this value other than to pass it with every callback to the client.
     */
    CallbackContext : IntPtr

    /**
     * Called when the management functionality determines that the client should advance the tail of its log.
     */
    AdvanceTailCallback : IntPtr

    /**
     * Called when an asynchronous request is initiated when <a href="https://docs.microsoft.com/windows/desktop/api/clfsmgmtw32/nf-clfsmgmtw32-handlelogfull">HandleLogFull</a> completes.
     */
    LogFullHandlerCallback : IntPtr

    /**
     * Called when a pinned log becomes unpinned.
     */
    LogUnpinnedCallback : IntPtr

}
