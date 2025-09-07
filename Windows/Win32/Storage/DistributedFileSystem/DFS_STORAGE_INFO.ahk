#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a DFS root or link target in a DFS namespace or from the cache maintained by the DFS client.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_3">DFS_INFO_3</a> and 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_4">DFS_INFO_4</a> structures each contain one or more 
  *     <b>DFS_STORAGE_INFO</b> structures, one for each DFS target. 
  *     Only one target can be marked as the active target. It is possible that no targets will be marked active.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_storage_info
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_STORAGE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * State of the target.
     * 
     * When this structure is returned as a result of calling the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/nf-lmdfs-netdfsgetinfo">NetDfsGetInfo</a> function, this member can be one of the 
     *       following values.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that specifies the DFS root target or link target server 
     *       name.
     * @type {PWSTR}
     */
    ServerName{
        get {
            if(!this.HasProp("__ServerName"))
                this.__ServerName := PWSTR(this.ptr + 8)
            return this.__ServerName
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that specifies the DFS root target or link target share 
     *       name.
     * @type {PWSTR}
     */
    ShareName{
        get {
            if(!this.HasProp("__ShareName"))
                this.__ShareName := PWSTR(this.ptr + 16)
            return this.__ShareName
        }
    }
}
