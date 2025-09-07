#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a DFS namespace. This structure contains the version GUID for the metadata for the namespace.
 * @remarks
 * This structure is used to detect when the metadata of a DFS namespace has changed. It is currently supported 
  *      only for  domain-based DFS namespace servers.
  * 
  * If a DFS namespace server does not support generation <b>GUID</b>s, the 
  *      <b>GUID</b> value returned by 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/nf-lmdfs-netdfsgetinfo">NetDfsGetInfo</a> contains a null 
  *      <b>GUID</b> (all zeros). This structure cannot be used with 
  *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/lmdfs/nf-lmdfs-netdfsgetclientinfo">NetDfsGetClientInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_7
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 * @version v4.0.30319
 */
class DFS_INFO_7 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The value of this <b>GUID</b> changes each time the DFS metadata is changed.
     * @type {Pointer<Guid>}
     */
    GenerationGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
