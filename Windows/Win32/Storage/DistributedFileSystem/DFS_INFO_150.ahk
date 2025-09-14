#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the security descriptor for a DFS link's reparse point.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_150
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_150 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * This member is reserved for system use.
     * @type {Integer}
     */
    SdLengthReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> 
     *       structure that specifies a self-relative security descriptor to be associated with the DFS link's reparse 
     *       point. This field is valid for DFS links only.
     * @type {Pointer<PSECURITY_DESCRIPTOR>}
     */
    pSecurityDescriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
