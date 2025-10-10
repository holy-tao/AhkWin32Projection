#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Input buffer used with the FSCTL_DFS_GET_PKT_ENTRY_STATE control code.
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_get_pkt_entry_state_arg
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_GET_PKT_ENTRY_STATE_ARG extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Length of the DFS Entry Path Unicode string in bytes stored in the <i>Buffer</i> 
     *       parameter.
     * @type {Integer}
     */
    DfsEntryPathLen {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Length of the Server Name Unicode string in bytes stored in the <i>Buffer</i> parameter 
     *       following the DFS Entry Path string.
     * @type {Integer}
     */
    ServerNameLen {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Length of the Share Name Unicode string in bytes stored in the <i>Buffer</i> parameter 
     *       following the Server Name string.
     * @type {Integer}
     */
    ShareNameLen {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Length of the Level string in bytes.
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * On input this contains the three Unicode strings in order. The Unicode strings are not 
     *       <b>NULL</b> terminated and there is no delimiter between the strings.
     * @type {String}
     */
    Buffer {
        get => StrGet(this.ptr + 12, 0, "UTF-16")
        set => StrPut(value, this.ptr + 12, 0, "UTF-16")
    }
}
