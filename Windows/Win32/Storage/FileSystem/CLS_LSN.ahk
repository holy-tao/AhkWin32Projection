#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a valid log address.
 * @remarks
 * The LSN is the valid address that is  unique to a client, and returned after the client appends a record to the log.  The address remains valid if the system does not fail, or its marshaled log buffer is  flushed successfully to disk.
  * 
  * In log streams, LSNs increase  monotonically. You cannot compare  LSNs between  log streams.
 * @see https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_lsn
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_LSN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The log sequence number (LSN).
     * @type {Integer}
     */
    Internal {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
