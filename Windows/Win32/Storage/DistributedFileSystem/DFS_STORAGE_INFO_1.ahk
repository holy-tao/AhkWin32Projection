#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DFS_TARGET_PRIORITY.ahk

/**
 * Contains information about a DFS target, including the DFS target server name and share name as well as the target's state and priority.
 * @remarks
 * 
  * This structure is used as the <b>Storage</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_6">DFS_INFO_6</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_storage_info_1
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_STORAGE_INFO_1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a null-terminated Unicode string that specifies the DFS root target or link target server name.
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
     * Pointer to a null-terminated Unicode string that specifies the DFS root target or link target share name.
     * @type {PWSTR}
     */
    ShareName{
        get {
            if(!this.HasProp("__ShareName"))
                this.__ShareName := PWSTR(this.ptr + 16)
            return this.__ShareName
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_target_priority">DFS_TARGET_PRIORITY</a> structure that contains a DFS target's priority class and rank.
     * @type {DFS_TARGET_PRIORITY}
     */
    TargetPriority{
        get {
            if(!this.HasProp("__TargetPriority"))
                this.__TargetPriority := DFS_TARGET_PRIORITY(this.ptr + 24)
            return this.__TargetPriority
        }
    }
}
