#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a valid log address.
 * @remarks
 * The LSN is the valid address that is  unique to a client, and returned after the client appends a record to the log.  The address remains valid if the system does not fail, or its marshaled log buffer is  flushed successfully to disk.
 * 
 * In log streams, LSNs increase  monotonically. You cannot compare  LSNs between  log streams.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_lsn
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLS_LSN {
    #StructPack 8

    /**
     * The log sequence number (LSN).
     */
    Internal : Int64

}
