#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * Contains the security descriptor for a DFS link's reparse point.
 * @see https://learn.microsoft.com/windows/win32/api/lmdfs/ns-lmdfs-dfs_info_150
 * @namespace Windows.Win32.Storage.DistributedFileSystem
 */
export default struct DFS_INFO_150 {
    #StructPack 8

    /**
     * This member is reserved for system use.
     */
    SdLengthReserved : UInt32

    /**
     * Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> 
     *       structure that specifies a self-relative security descriptor to be associated with the DFS link's reparse 
     *       point. This field is valid for DFS links only.
     */
    pSecurityDescriptor : PSECURITY_DESCRIPTOR

}
