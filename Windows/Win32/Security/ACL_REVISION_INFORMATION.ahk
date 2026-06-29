#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains revision information about an ACL structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-acl_revision_information
 * @namespace Windows.Win32.Security
 */
export default struct ACL_REVISION_INFORMATION {
    #StructPack 4

    /**
     * Specifies a revision number. The current revision number is ACL_REVISION.
     */
    AclRevision : UInt32

}
