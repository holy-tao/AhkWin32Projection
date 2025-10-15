#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about a DFS root or link, including comment, state, time-out, and DFS behaviors specified by property flags.
 * @see https://docs.microsoft.com/windows/win32/api//lmdfs/ns-lmdfs-dfs_info_105
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_105 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains a comment associated with the DFS root or 
     *       link.
     * @type {PWSTR}
     */
    Comment{
        get {
            if(!this.HasProp("__Comment"))
                this.__Comment := PWSTR(this.ptr + 0)
            return this.__Comment
        }
    }

    /**
     * Specifies a set of bit flags that describe the state of the DFS root or link; the state of the DFS 
     *       namespace root cannot be changed. One <b>DFS_VOLUME_STATE</b> flag is set, and one 
     *       <b>DFS_VOLUME_FLAVOR</b> flag is set. For an example that describes the interpretation of 
     *       these flags, see the Remarks section of 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/lmdfs/ns-lmdfs-dfs_info_2">DFS_INFO_2</a>.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the time-out, in seconds, of the DFS root or link.
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies a mask value that indicates which flags are valid for evaluation in the 
     *       <b>PropertyFlags</b> field.
     * @type {Integer}
     */
    PropertyFlagMask {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Bitfield, with each bit responsible for a specific property applicable to the whole DFS namespace, the DFS 
     *       root, or an individual DFS link, depending on the actual property.  Any combination of bits is allowed unless 
     *       indicated otherwise.
     * @type {Integer}
     */
    PropertyFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
